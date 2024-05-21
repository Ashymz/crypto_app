import 'dart:async';

import 'package:crypto_app/presentation/trading_screen.dart';
import 'package:crypto_app/widgets/heartbeat_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with WidgetsBindingObserver {
  void launch() {
    Timer(const Duration(seconds: 5), () {
      Get.to(TradingScreen());
    });
  }

  @override
  void initState() {
    super.initState();
    launch();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data:
          MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(0.85)),
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Center(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Colors.transparent,
                    height: height,
                    width: width,
                  ),
                  HeartbeatAnimation(
                      child:
                          Center(child: Image.asset('assets/images/logo.png'))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
