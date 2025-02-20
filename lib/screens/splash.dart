import 'package:admin/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      _controller = VideoPlayerController.asset('assets/Logo.mp4');

      await _controller.initialize();

      if (mounted) {
        setState(() {});
        _controller.play();
        _controller.setLooping(false);
      }

      // Listen for video completion
      _controller.addListener(() {
        if (_controller.value.position >= _controller.value.duration) {
          _navigateToLogin();
        }
      });
    } catch (error) {
      if (mounted) {
        setState(() {
          _isError = true;
        });
        print('Video initialization error: $error');

        // Auto-navigate after a delay if video fails
        Future.delayed(const Duration(seconds: 2), () {
          _navigateToLogin();
        });
      }
    }
  }

  void _navigateToLogin() {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:
            _isError
                ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Unable to load splash video'),
                    SizedBox(height: 16),
                    CircularProgressIndicator(),
                  ],
                )
                : !_controller.value.isInitialized
                ? const CircularProgressIndicator()
                : AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
