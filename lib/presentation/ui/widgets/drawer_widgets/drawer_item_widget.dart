import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onClick;
  const DrawerItemWidget({
    super.key,
    required this.title,
    required this.onClick,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      decoration: BoxDecoration(
        color: AppPalette.steelGray,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,

                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        leading: Icon(icon, color: AppPalette.secondaryText),
        onTap: onClick,
      ),
    );
  }
}
