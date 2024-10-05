import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
        _showMessage('No cameras available');
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
    if (_cameraController != null) {
      _cameraController.dispose();
    }
    super.dispose();
  }

  void _switchCamera() async {
    if (cameras != null && cameras!.length > 1) {
      try {
        await _cameraController.dispose();
        selectedCameraIndex = (selectedCameraIndex + 1) % cameras!.length;
        _startCamera(selectedCameraIndex);
      } catch (e) {
        print('Error switching camera: $e');
      }
    } else {
      _showMessage('No other camera available');
    }
  }

  Future<void> _captureImage() async {
    try {
      await _initializeControllerFuture;
      final image = await _cameraController.takePicture();
      _getPredictionAndSendDetails(image.path);
    } catch (e) {
      print('Error capturing image: $e');
    }
  }

  Future<void> _openGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _getPredictionAndSendDetails(pickedFile.path);
      } else {
        print('No image selected');
      }
    } catch (e) {
      print('Error opening gallery: $e');
    }
  }

  void _getPredictionAndSendDetails(String imagePath) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // Step 1: Call the prediction API first
    final predictionResult = await ApiService.predictImage(File(imagePath));

    if (predictionResult != null) {
      print('Prediction received: $predictionResult');

      // Step 2: Prepare the request body as per the expected structure

      // Convert the list of key research topics into a dictionary with descriptions
      Map<String, String> keyResearchTopics = {
        for (var topic in predictionResult['key_research_topics'])
          topic: "Description of $topic"
      };

      // Create the request body to send
      final Map<String, dynamic> requestBody = {
        "user_id": globals.userId ?? 0,
        "predicted_class": predictionResult['predicted_class'],
        "confidence": predictionResult['confidence'],
        "image_url": 'https://firebasestorage.googleapis.com/v0/b/microbio-c5c95.appspot.com/o/20240805_144043.jpg?alt=media&token=9c39bd4a-6273-4542-9f00-6b438bd60f2f', // Replace with actual image URL
        "about": predictionResult['about'],
        "key_research_topics": keyResearchTopics, // Dictionary of research topics
        "uses": predictionResult['uses'],
        "illnesses_caused": predictionResult['illnesses_caused'],
        "articles": predictionResult['articles'] ?? []
      };

      // Step 3: Send the updated data back to the backend
      bool predictionSaved = await ApiService.sendPredictionDetails(requestBody);

      Navigator.pop(context);  // Close the progress indicator

      if (predictionSaved) {
        _showMessage('Prediction saved successfully!');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(data: predictionResult, imagePath: imagePath),
          ),
        );
      } else {
        _showMessage('Failed to save prediction');
      }
    } else {
      Navigator.pop(context);  // Close the progress indicator
      _showMessage('Failed to get prediction');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Keep the subjects inside the area',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
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
                          style: const TextStyle(color: Colors.red)),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.photo, color: Colors.white70),
                onPressed: _openGallery,
              ),
              FloatingActionButton(
                backgroundColor: Colors.white,
                child: const Icon(Icons.camera_alt, color: Colors.black),
                onPressed: _captureImage,
              ),
              IconButton(
                icon: const Icon(Icons.switch_camera, color: Colors.white70),
                onPressed: _switchCamera,
              ),
            ],
          ),
        ],
      ),
    );
  }
}