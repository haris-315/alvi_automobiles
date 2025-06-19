import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onClick;
  final bool isSelected;

  const DrawerItemWidget({
    super.key,
    required this.title,
    required this.onClick,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? AppPalette.goldAccent.withOpacity(0.15)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border:
              isSelected
                  ? Border.all(
                    color: AppPalette.goldAccent.withOpacity(0.3),
                    width: 1,
                  )
                  : null,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: Text(
            title,
            style: TextStyle(
              color: isSelected ? AppPalette.goldAccent : Colors.white,
              fontSize: 15,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          leading: Icon(
            icon,
            color:
                isSelected ? AppPalette.goldAccent : AppPalette.secondaryText,
            size: 22,
          ),
          trailing:
              isSelected
                  ? Icon(Icons.chevron_right, color: AppPalette.goldAccent)
                  : null,
          onTap: onClick,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
