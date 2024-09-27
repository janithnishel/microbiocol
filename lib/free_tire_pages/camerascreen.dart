import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart'; // Import the image_picker package

class CameraUI extends StatefulWidget {
  @override
  _CameraUIState createState() => _CameraUIState();
}

class _CameraUIState extends State<CameraUI> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  bool isSingleMode = true;
  List<CameraDescription>? cameras;
  int selectedCameraIndex = 0;
  final ImagePicker _picker = ImagePicker(); // Initialize ImagePicker

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
      setState(() {}); // Refresh the UI once the camera is initialized
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
      // Handle captured image logic here
      print('Image captured: ${image.path}');
    } catch (e) {
      print('Error capturing image: $e');
    }
  }

  Future<void> _openGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        print('Selected image path: ${pickedFile.path}');
        // You can use the pickedFile for further processing
      } else {
        print('No image selected');
      }
    } catch (e) {
      print('Error opening gallery: $e');
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
                    return Center(child: Text('Camera error: ${snapshot.error}', style: TextStyle(color: Colors.red)));
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSingleMode = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: !isSingleMode ? Colors.blue : Colors.transparent,
                  ),
                  child: Text(
                    'Stack',
                    style: TextStyle(
                      color: !isSingleMode ? Colors.white : Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSingleMode = true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isSingleMode ? Colors.blue : Colors.transparent,
                  ),
                  child: Text(
                    'Single',
                    style: TextStyle(
                      color: isSingleMode ? Colors.white : Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.photo, color: Colors.white70),
                  onPressed: _openGallery, // Open gallery when button is pressed
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
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}