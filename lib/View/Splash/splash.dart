import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Utils/Constant/images.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showLottie = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showLottie = true;
      });

      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AImages.backGroundImages),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: _showLottie ? 0.0 : 1.0,
                  duration: const Duration(seconds: 1),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration:  BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AImages.loginLogo),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (_showLottie)
                  Center(
                    child: ClipOval(
                      child: SizedBox(
                        width: 300,
                        height: 300,
                        child: Lottie.asset(AImages.animation,
                          fit: BoxFit.cover,
                          repeat: true,
                          reverse: false,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
