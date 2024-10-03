import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:microbiocol/api_services/apiservice.dart';
import 'package:microbiocol/free_tire_pages/details_page.dart';
import 'package:microbiocol/global.dart' as globals;

class CameraUI extends StatefulWidget {
  @override
  _CameraUIState createState() => _CameraUIState();
}

class _CameraUIState extends State<CameraUI> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  List<CameraDescription>? cameras;
  int selectedCameraIndex = 0;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras != null && cameras!.isNotEmpty) {
        _startCamera(selectedCameraIndex);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No cameras available')),
        );
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  void _startCamera(int cameraIndex) {
    try {
      _cameraController = CameraController(
        cameras![cameraIndex],
        ResolutionPreset.high,
      );

      _initializeControllerFuture = _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      }).catchError((e) {
        print('Error initializing camera: $e');
      });
    } catch (e) {
      print('Error starting camera: $e');
    }
  }

  @override
  void dispose() {
    // Ensure the camera controller is disposed properly
    if (_cameraController != null) {
      _cameraController.dispose();
    }
    super.dispose();
  }

  void _switchCamera() async {
    if (cameras != null && cameras!.length > 1) {
      try {
        await _cameraController.dispose(); // Dispose of the current camera before switching
        selectedCameraIndex = (selectedCameraIndex + 1) % cameras!.length;
        _startCamera(selectedCameraIndex);
      } catch (e) {
        print('Error switching camera: $e');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No other camera available')),
      );
    }
  }

  Future<void> _captureImage() async {
    try {
      await _initializeControllerFuture;
      final image = await _cameraController.takePicture();
      _getPredictionAndUploadImage(image.path);
    } catch (e) {
      print('Error capturing image: $e');
    }
  }

  Future<void> _openGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _getPredictionAndUploadImage(pickedFile.path);
      } else {
        print('No image selected');
      }
    } catch (e) {
      print('Error opening gallery: $e');
    }
  }

  Future<String> _uploadImageToFirebase(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('uploads/$fileName.jpg');

      UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);

      // Monitor the upload progress
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        print('Task state: ${snapshot.state}');
        print('Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
      });

      // Wait for the upload to complete
      TaskSnapshot taskSnapshot = await uploadTask;

      // Get the download URL of the uploaded file
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      print('Upload successful! Download URL: $downloadURL');
      return downloadURL;
    } catch (e) {
      print('Error uploading image to Firebase: $e');
      return '';
    }
  }

  void _getPredictionAndUploadImage(String imagePath) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    // Step 1: Call the prediction API first (without uploading the image yet)
    final predictionResult = await ApiService.predictImage(File(imagePath));

    if (predictionResult != null) {
      print('Prediction received: $predictionResult');

      // Step 2: Upload the image to Firebase Storage
      String imageUrl = await _uploadImageToFirebase(File(imagePath));

      if (imageUrl.isNotEmpty) {
        print('Image uploaded successfully. URL: $imageUrl');

        // Step 3: Add user_id and image_url to the prediction result
        predictionResult['user_id'] = globals.userId ?? 0; // Fallback to 0 if userId is null
        predictionResult['image_url'] = imageUrl; // Attach the Firebase image URL

        // Step 4: Send the updated data (with the image URL) back to the backend
        bool predictionSaved = await ApiService.sendPredictionDetails(predictionResult);

        Navigator.pop(context);  // Close the progress indicator

        if (predictionSaved) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Prediction saved successfully!')),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(data: predictionResult, imagePath: imagePath),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to save prediction')),
          );
        }
      } else {
        Navigator.pop(context);  // Close the progress indicator
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to upload image')),
        );
      }
    } else {
      Navigator.pop(context);  // Close the progress indicator
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to get prediction')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Center(
            child: Text(
              'Keep the subjects inside the area',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Center(
              child: FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _cameraController.value.aspectRatio,
                      child: CameraPreview(_cameraController),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Camera error: ${snapshot.error}',
                          style: TextStyle(color: Colors.red)),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.photo, color: Colors.white70),
                onPressed: _openGallery,
              ),
              FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(Icons.camera_alt, color: Colors.black),
                onPressed: _captureImage,
              ),
              IconButton(
                icon: Icon(Icons.switch_camera, color: Colors.white70),
                onPressed: _switchCamera,
              ),
            ],
          ),
        ],
      ),
    );
  }
}