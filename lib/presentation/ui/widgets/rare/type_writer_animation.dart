import 'dart:math' as math;

import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:flutter/material.dart';

class TypeWriterAnimation extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;

  const TypeWriterAnimation({super.key, required this.text, this.textStyle});

  @override
  State<TypeWriterAnimation> createState() => TypeWriterAnimationState();
}

class TypeWriterAnimationState extends State<TypeWriterAnimation>
    with SingleTickerProviderStateMixin {
  String visibleText = "";
  int _currentIndex = 0;
  late AnimationController _cursorController;
  bool _showCursor = true;

  @override
  void initState() {
    super.initState();
    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 70),
    )..repeat(reverse: true);
    _startTyping();
  }

  void _startTyping() async {
    final duration = Duration(milliseconds: 5 + (math.Random().nextInt(86)));
    while (_currentIndex < widget.text.length) {
      await Future.delayed(duration);
      if (!mounted) return;
      setState(() {
        visibleText += widget.text[_currentIndex];
        _currentIndex++;
      });
    }
    setState(() {
      _showCursor = false;
    });
  }

  @override
  void dispose() {
    _cursorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            visibleText,
            style: widget.textStyle,
            maxLines: 6,
            textAlign: TextAlign.center,
          ),
        ),
        if (_showCursor)
          AnimatedBuilder(
            animation: _cursorController,
            builder: (context, child) {
              return Opacity(opacity: _cursorController.value, child: child);
            },
            child: Container(
              width: 2,
              height: widget.textStyle?.fontSize ?? 16,
              margin: const EdgeInsets.only(left: 2),
              color: AppPalette.electricBlue,
            ),
          ),
      ],
    );
  }
}
