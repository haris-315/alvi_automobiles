// ignore_for_file: constant_identifier_names

import 'package:alvi_automobiles/core/services/interface/service.dart';
import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:flutter/material.dart';

enum SnackbarType {
  INFORMATIVE(baseMsg: "Info", icon: Icons.info, icolor: AppPalette.infoBlue),
  WARNING(
    baseMsg: "Warning",
    icon: Icons.warning,
    icolor: AppPalette.warningAmber,
  ),
  ERROR(baseMsg: "Error", icon: Icons.error, icolor: AppPalette.errorRed);

  final IconData icon;
  final Color icolor;
  final String baseMsg;

  const SnackbarType({
    required this.icon,
    required this.icolor,
    required this.baseMsg,
  });
}

class SnackbarService extends Service {
  SnackbarService(
    BuildContext context, {
    required SnackbarType snackbarType,
    String details = "",
  }) {
    super.logToConsole(
      "Snackbar of type $snackbarType requested",
      snackbarType.runtimeType,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: AppPalette.secondaryBackground,

          content: Row(
            children: [
              Icon(snackbarType.icon, color: snackbarType.icolor),
              Text(
                "${snackbarType.baseMsg}: $details",
                style: TextStyle(
                  fontSize: AppPalette.bodyMedium,
                  color: AppPalette.secondaryText,
                ),
              ),
            ],
          ),
        ),
      );
  }
}
