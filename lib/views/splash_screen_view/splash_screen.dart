import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';
import '../../router.router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isLoggedIn = false;

  Future<void> _performAsyncOperations() async {
    final SharedPreferences prefs = await _prefs;

    if (prefs.getString("api_secret") != null &&
        prefs.getString("api_key") != null) {
      isLoggedIn = true;
      final token = await getTocken();
      Logger().i(token);
    }
    await Future.delayed(const Duration(seconds: 3));
  }

  double opacity = 1.0; // Initial opacity for fade-out animation

  @override
  void initState() {
    super.initState();
    _performAsyncOperations().then((_) {
      if (isLoggedIn) {
        Navigator.popAndPushNamed(context, Routes.homePageScreen);
      } else {
        Navigator.popAndPushNamed(context, Routes.loginViewScreen);
      }
    });

    // Start the fade-out animation after 2 seconds (adjust timing as needed)
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        opacity = 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(seconds: 3),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 20, 0.0, 0.0),
                  child: Center(
                    child: Text(
                      'Face Attendance\n Developed by Quantbit Technologies Pvt. Ltd.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
