// ignore_for_file: use_build_context_synchronously

import 'package:alvi_automobiles/core/network/cubit/network_cubit.dart';
import 'package:alvi_automobiles/presentation/ui/bootstrap/network/no_connection_page.dart';
import 'package:alvi_automobiles/presentation/ui/pages/home/home_screen.dart';
import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/rare/type_writer_animation.dart';
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
  late Animation<Offset> _topToBottom;
  late Animation<Offset> _bottomToTop;
  late Animation<double> _opacity;
  late AnimationController _animationController;
  bool shouldAnimateText = false;
  @override
  void initState() {
    super.initState();
    // checkNetworkAvailability();
    initializeFields();
    _animationController.forward().then((_) {
      Future.delayed(Duration(seconds: 1)).then((_) {
        setState(() {
          shouldAnimateText = true;
        });
        checkNetworkAvailability();
      });
    });
  }

  void checkNetworkAvailability() async {
    await Future.delayed(Duration(seconds: 5));
    context.read<NetworkCubit>().checkForNetwork(
      availabilityCallback: () {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: AlviHome(),
          ),
        );
      },
      inAvailablitiyCallBack: () {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: NoConnectionPage(),
          ),
        );
      },
    );
  }

  void initializeFields() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _topToBottom = Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: FlippedCurve(Curves.bounceIn),
      ),
    );
    _bottomToTop = Tween(begin: Offset(0, 2), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: FlippedCurve(Curves.bounceIn),
      ),
    );
    _opacity = Tween<double>(begin: .3, end: 1).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 90),
          SlideTransition(
            position: _topToBottom,
            child: Column(
              children: [
                Image.asset("assets/alvi.gif", height: 80),
                Text(
                  "Automobiles",
                  style: TextStyle(
                    fontSize: AppPalette.headlineLarge,
                    fontWeight: FontWeight.bold,
                    color: AppPalette.secondaryText,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          SlideTransition(
            position: _bottomToTop,
            child: FadeTransition(
              opacity: _opacity,
              child: Column(
                children: [
                  Image.asset("assets/frequency_sticker.webp"),
                  SizedBox(height: 12),
                  if (shouldAnimateText)
                    TypeWriterAnimation(
                      text: "Speeding Thrills\nBut\nIt Kills".toUpperCase(),
                      textStyle: TextStyle(
                        fontSize: AppPalette.bodyMedium,
                        fontWeight: FontWeight.w400,
                        color: AppPalette.primaryText,
                      ),
                    ),
                  SizedBox(height: 18),
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 190),
                      child: LinearProgressIndicator(
                        backgroundColor: AppPalette.steelGray,
                        color: AppPalette.pearlWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
