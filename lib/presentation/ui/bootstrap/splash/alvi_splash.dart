import 'package:alvi_automobiles/core/network/cubit/network_cubit.dart';
import 'package:alvi_automobiles/presentation/ui/bootstrap/network/no_connection_page.dart';
import 'package:alvi_automobiles/presentation/ui/pages/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class AlviSplash extends StatefulWidget {
  const AlviSplash({super.key});

  @override
  State<AlviSplash> createState() => _AlviSplashState();
}

class _AlviSplashState extends State<AlviSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _logoScale;
  late Animation<double> _textOpacity;
  late Animation<Offset> _textSlide;
  late Animation<double> _progressValue;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    // Logo scale animation
    _logoScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack),
      ),
    );

    // Text opacity animation
    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 0.8, curve: Curves.easeIn),
      ),
    );

    // Text slide animation
    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOutQuad),
      ),
    );

    // Progress animation
    _progressValue = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.7, 1.0, curve: Curves.linear),
      ),
    );

    _animationController.forward().then((_) {
      checkNetworkAvailability();
    });
  }

  void checkNetworkAvailability() async {
    // Your existing network check logic
    await Future.delayed(const Duration(seconds: 2));
    context.read<NetworkCubit>().checkForNetwork(
      availabilityCallback: () {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 800),
            child: AlviHome(),
          ),
        );
      },
      inAvailablitiyCallBack: () {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 800),
            child: NoConnectionPage(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo with scale animation
              ScaleTransition(
                scale: _logoScale,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/alvi.gif",
                      height: 100,
                      filterQuality: FilterQuality.high,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "AUTOMOBILES",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Text with slide and fade animation
              FadeTransition(
                opacity: _textOpacity,
                child: SlideTransition(
                  position: _textSlide,
                  child: Column(
                    children: [
                      Text(
                        "SPEEDING THRILLS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.8),
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "BUT IT KILLS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.8),
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Animated progress indicator
              AnimatedBuilder(
                animation: _progressValue,
                builder: (context, child) {
                  return SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      value: _progressValue.value,
                      backgroundColor: Colors.grey[800],
                      color: Colors.white,
                      minHeight: 4,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}