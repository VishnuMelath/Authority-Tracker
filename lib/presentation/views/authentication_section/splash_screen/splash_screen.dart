// ignore_for_file: use_build_context_synchronously

import 'package:authority_tracker/config/route/route_names.dart';
import 'package:authority_tracker/config/theme/colors.dart';
import 'package:authority_tracker/data/data_sources/user_cache.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Durations.medium4, () async {
      var isloggedIn = await UserCache.checkIsLoggedIn();
      if (isloggedIn) {
        context.goNamed(AppRouteNames.homeScreen);
      } else {
        context.goNamed(AppRouteNames.login);
      }
    });
    super.initState();
  }

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
            CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
