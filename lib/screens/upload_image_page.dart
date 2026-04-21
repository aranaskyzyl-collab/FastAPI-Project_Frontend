// ignore_for_file: curly_braces_in_flow_control_structures, deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UploadImagePage extends StatefulWidget {
  const UploadImagePage({super.key});

  @override
  State<UploadImagePage> createState() => _RealTimeDetectionPageState();
}

class _RealTimeDetectionPageState extends State<UploadImagePage> {
  CameraController? _controller;
  Timer? _timer;
  bool _isProcessing = false;

  String _disease = "Scanning...";
  String _confidence = "0";
  String _management = "Align leaf in frame";

  @override
  void initState() {
    super.initState();
    _setupCamera();
  }

  Future<void> _setupCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) return;

      _controller = CameraController(
        cameras[0],
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg, // Optimization for mobile
      );

      await _controller!.initialize();
      if (!mounted) return;

      setState(() {});

      // Optimization: Increased interval to 1.5 seconds.
      // 500ms is too fast for a cloud-based Hybrid CNN-GAT model.
      _timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
        if (!_isProcessing) _analyzeFrame();
      });
    } catch (e) {
      debugPrint("Camera Setup Error: $e");
    }
  }

  Future<void> _analyzeFrame() async {
    // Safety checks
    if (_controller == null ||
        !_controller!.value.isInitialized ||
        _isProcessing ||
        !mounted) return;

    setState(() => _isProcessing = true);

    try {
      // 1. Capture and convert
      final XFile image = await _controller!.takePicture();
      final Uint8List bytes = await image.readAsBytes();

      // Optimization: Check if base64 needs the data:image/jpeg;base64 prefix
      // Your Python code uses .split(","), so we should include the prefix.
      final String base64Image =
          "data:image/jpeg;base64,${base64Encode(bytes)}";

      // 2. API Call
      final url = Uri.parse("https://fastapi-project-ytrt.onrender.com/stream");
      final response = await http
          .post(
            url,
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
            body: jsonEncode({"image": base64Image}),
          )
          .timeout(
              const Duration(seconds: 15)); // Reduced timeout for better UX

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Handle potential error responses from your Python try/except block
        if (data['disease'] == "Error") {
          _updateUI("Error", "0", data['management'] ?? "Check Backend");
        } else {
          _updateUI(
              data['disease'] ?? "Unknown",
              data['confidence']?.toString() ?? "0",
              data['management'] ?? "No advice.");
        }
      } else {
        _updateUI("Server Error", "0", "Status: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Real-time Error: $e");
      _updateUI("Connection Error", "0", "Server is waking up. Please wait...");
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  // Helper to prevent calling setState if widget is unmounted
  void _updateUI(String disease, String confidence, String management) {
    if (!mounted) return;
    setState(() {
      _disease = disease;
      _confidence = confidence;
      _management = management;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Scaffold(
          backgroundColor: Colors.black,
          body: Center(child: CircularProgressIndicator(color: Colors.green)));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rice Disease Detection"),
        backgroundColor: Colors.green[800],
        elevation: 0,
      ),
      body: Stack(
        children: [
          // 1. Camera Preview with FittedBox to prevent stretching
          Positioned.fill(
            child: AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: CameraPreview(_controller!),
            ),
          ),

          // 2. Results Overlay (Top)
          Positioned(
            top: 20,
            left: 15,
            right: 15,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: _disease == "Healthy"
                        ? Colors.greenAccent
                        : Colors.redAccent,
                    width: 2),
              ),
              child: Column(
                children: [
                  Text(
                    _disease.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  LinearProgressIndicator(
                    value: (double.tryParse(_confidence) ?? 0) / 100,
                    backgroundColor: Colors.white24,
                    color: Colors.greenAccent,
                  ),
                  Text(
                    "CONFIDENCE: $_confidence%",
                    style: const TextStyle(
                        color: Colors.greenAccent, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),

          // 3. Management Advice (Bottom)
          Positioned(
            bottom: 40,
            left: 15,
            right: 15,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline,
                          color: Colors.green[800], size: 18),
                      const SizedBox(width: 8),
                      const Text(
                        "MANAGEMENT PLAN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                    _management,
                    style: const TextStyle(
                        fontSize: 14, color: Colors.black87, height: 1.4),
                  ),
                ],
              ),
            ),
          ),

          // 4. Loading indicator
          if (_isProcessing)
            Positioned(
              top: 30,
              right: 30,
              child: const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                      strokeWidth: 2, color: Colors.greenAccent)),
            ),
        ],
      ),
    );
  }
}
