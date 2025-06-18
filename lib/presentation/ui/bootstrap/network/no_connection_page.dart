import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

class NoConnectionPage extends StatefulWidget {
  const NoConnectionPage({super.key});

  @override
  State<NoConnectionPage> createState() => _NoConnectionPageState();
}

class _NoConnectionPageState extends State<NoConnectionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPalette.scaffoldBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                Icon(
                  MdiIcons.cellphone,
                  size: 180,
                  color: AppPalette.pearlWhite,
                ),
                Positioned(
                  left: 70,
                  top: 70,
                  child: Icon(
                    MdiIcons.wifiOff,
                    size: 42,
                    color: AppPalette.pearlWhite,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "It seems like there is an issue with you internet",
              textAlign: TextAlign.center,
              maxLines: 6,

              style: TextStyle(
                fontSize: AppPalette.bodyLarge,
                color: AppPalette.secondaryText,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
