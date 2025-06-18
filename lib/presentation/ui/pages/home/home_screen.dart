import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/common/alvi_appbar.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/common/alvi_drawer.dart';
import 'package:flutter/material.dart';

class AlviHome extends StatefulWidget {
  const AlviHome({super.key});

  @override
  State<AlviHome> createState() => _AlviHomeState();
}

class _AlviHomeState extends State<AlviHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AlviDrawer(),
      appBar: alviAppBar(hasDrawer: true),

      backgroundColor: AppPalette.scaffoldBackground,
      // body: ,
    );
  }
}
