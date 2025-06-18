import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget alviAppBar({
  String title = "Alvi Automobiles",
  List<Widget> actions = const [],
  bool shouldShowPopButton = true,
}) => AppBar(
  centerTitle: true,
  backgroundColor: AppPalette.secondaryBackground,
  title: Text(
    title,
    style: TextStyle(
      color: AppPalette.primaryText,
      fontSize: AppPalette.headlineMedium,
      overflow: TextOverflow.ellipsis,
    ),
  ),
);
