import 'package:alvi_automobiles/core/network/cubit/network_cubit.dart';
import 'package:alvi_automobiles/core/observer/app_observer.dart';
import 'package:alvi_automobiles/presentation/state_management/drawer/cubit/drawer_cubit.dart';
import 'package:alvi_automobiles/presentation/state_management/home/cubit/home_cubit.dart';
import 'package:alvi_automobiles/presentation/ui/bootstrap/splash/alvi_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const AlviAutomobiles());
}

class AlviAutomobiles extends StatelessWidget {
  const AlviAutomobiles({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/alvi.gif"), context);
    precacheImage(AssetImage("assets/splash_wheel.gif"), context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NetworkCubit()),
        BlocProvider(create: (_) => DrawerCubit()),
        BlocProvider(create: (_) => HomeCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const AlviSplash(),
      ),
    );
  }
}
