import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:microbiocol/api_services/apiservice.dart';
import 'package:microbiocol/free_tire_pages/details_page.dart';

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
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void _switchCamera() {
    if (cameras != null && cameras!.length > 1) {
      selectedCameraIndex = (selectedCameraIndex + 1) % cameras!.length;
      _startCamera(selectedCameraIndex);
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
      _navigateToDetails(image.path);
    } catch (e) {
      print('Error capturing image: $e');
    }
  }

  Future<void> _openGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _navigateToDetails(pickedFile.path);
      } else {
        print('No image selected');
      }
    } catch (e) {
      print('Error opening gallery: $e');
    }
  }

  void _navigateToDetails(String imagePath) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    final result = await ApiService.predictImage(File(imagePath));

    Navigator.pop(context); // Close the progress indicator

    if (result != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(data: result, imagePath: imagePath),
        ),
      );
    } else {
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