import 'package:authority_tracker/config/theme/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Authority Tracker',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
