import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // For Camera Preview

class CameraUI extends StatefulWidget {
  @override
  _CameraUIState createState() => _CameraUIState();
}

class _CameraUIState extends State<CameraUI> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  bool isSingleMode = true;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
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
            // Navigate back
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10), // A small space for the app bar
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
          // Camera preview box (Placeholder for now)
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
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          // Stack/Single Toggle Button
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
          // Capture Button and Icons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.photo, color: Colors.white70),
                  onPressed: () {
                    // Gallery button pressed
                  },
                ),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.camera_alt, color: Colors.black),
                  onPressed: () async {
                    try {
                      await _initializeControllerFuture;
                      // Capture Image Logic here
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.switch_camera, color: Colors.white70),
                  onPressed: () {
                    // Switch camera logic
                  },
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


