import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:flutter/material.dart';

class AuthInputField extends StatefulWidget {
  final String hint;
  final String label;
  final IconData icon;
  final bool forPassword;
  final double width;
  final TextEditingController controller;
  final Function(String?) validator;
  final TextInputType keyboardType;

  const AuthInputField({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    required this.icon,
    this.forPassword = false,
    this.width = 340,
    required this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<AuthInputField> createState() => _SignUpFieldState();
}

class _SignUpFieldState extends State<AuthInputField> {
  OutlineInputBorder _inputBorder(Color color) => OutlineInputBorder(
    borderSide: BorderSide(color: AppPalette.pearlWhite),
    borderRadius: BorderRadius.circular(12),
  );
  bool passVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: SizedBox(
        width: widget.width,
        height: 55,
        child: TextFormField(
          controller: widget.controller,
          validator: (val) {
            widget.validator(val);
            return null;
          },
          cursorColor: AppPalette.goldAccent,
          style: TextStyle(color: AppPalette.accentText),
          obscureText: widget.forPassword && !passVisible,

          decoration: InputDecoration(
            border: _inputBorder(AppPalette.secondaryBackground),
            focusedBorder: _inputBorder(AppPalette.goldAccent),
            hintStyle: TextStyle(color: AppPalette.disabledText),
            labelStyle: TextStyle(color: AppPalette.secondaryText),

            hintText: widget.hint,
            label: Text(widget.label),
            prefixIcon: Icon(widget.icon, color: AppPalette.goldAccent),
            suffixIcon:
                !widget.forPassword
                    ? null
                    : GestureDetector(
                      onTap: () {
                        setState(() {
                          passVisible = !passVisible;
                        });
                      },
                      child: Icon(
                        passVisible ? Icons.visibility_off : Icons.visibility,
                        size: 18,
                        color: AppPalette.goldAccent,
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}
