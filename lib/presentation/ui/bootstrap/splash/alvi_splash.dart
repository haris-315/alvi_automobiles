// ignore_for_file: use_build_context_synchronously

import 'package:alvi_automobiles/core/network/cubit/network_cubit.dart';
import 'package:alvi_automobiles/presentation/ui/bootstrap/network/no_connection_page.dart';
import 'package:alvi_automobiles/presentation/ui/pages/home/home_screen.dart';
import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/common/alvi_appbar.dart';
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
  @override
  void initState() {
    super.initState();
    // checkNetworkAvailability();
    initializeFields();
    _animationController.forward();
  }

  void checkNetworkAvailability() async {
    await Future.delayed(Duration(seconds: 5));
    context.read<NetworkCubit>().checkForNetwork(
      availabilityCallback: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.leftToRight,
            child: AlviHome(),
          ),
        );
      },
      inAvailablitiyCallBack: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.leftToRight,
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
      appBar: alviAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 30),
          SlideTransition(
            position: _topToBottom,
            child: Column(
              children: [
                Image.asset("assets/alvi.gif"),
                Text(
                  "Automobiles",
                  style: TextStyle(
                    fontSize: AppPalette.headlineLarge,
                    fontWeight: FontWeight.bold,
                    color: AppPalette.secondaryText,
                  ),
                ),
                Image.asset("assets/frequency_sticker.webp"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
