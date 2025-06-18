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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppPalette.midnightBlue.withValues(alpha: .3),
                    AppPalette.deepOcean.withValues(alpha: .4),
                    AppPalette.electricBlue.withValues(alpha: .3),
                  ],
                ),
              ),
            ),
            Center(
              child: Icon(
                MdiIcons.cellphone,
                size: 90,
                color: AppPalette.pearlWhite,
              ),
            ),
            SizedBox(height: 28),
            Center(child: Icon(MdiIcons.wifiOff, color: AppPalette.pearlWhite)),
          ],
        ),
      ],
    );
  }
}
