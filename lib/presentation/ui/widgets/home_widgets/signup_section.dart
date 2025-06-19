// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alvi_automobiles/core/functions/email_verification.dart';
import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:flutter/material.dart';

class SignupSection extends StatefulWidget {
  const SignupSection({super.key});

  @override
  State<SignupSection> createState() => _SignupSectionState();
}

class _SignupSectionState extends State<SignupSection> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passConfirmController = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _firstNameController.dispose();
    _emailController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _lastNameController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: AppPalette.cardColor,
        child: Form(
          key: signUpFormKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: AppPalette.accentText,
                    fontSize: AppPalette.headlineMedium,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Join us to get\nthe most out of our platform",
                  maxLines: 5,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppPalette.secondaryText,
                    fontSize: AppPalette.bodyMedium,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),

                SignUpField(
                  controller: _firstNameController,
                  hint: "First Name",
                  label: "First Name",
                  icon: Icons.person,
                  validator: (val) {
                    if (val != null || val!.isEmpty) {
                      return "Please enter you name";
                    }
                    if (val.length < 2) return "Please enter correct name.";
                    return null;
                  },
                ),
                SignUpField(
                  controller: _lastNameController,
                  hint: "First Name",
                  label: "Last Name",
                  icon: Icons.person,
                  validator: (val) {
                    return null;
                  },
                ),
                SignUpField(
                  controller: _emailController,
                  hint: "Email",
                  label: "Email",
                  keyboardType: TextInputType.emailAddress,
                  icon: Icons.email,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) return "Email is required!";
                    if (!isValidEmail(val)) {
                      return "Please enter a valid email address.";
                    }
                    return null;
                  },
                ),
                SignUpField(
                  controller: _phoneController,
                  hint: "Phone",
                  label: "Phone",
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) return "Phone is required!";
                    // if (!isValidPakistaniPhoneNumber(val)) {
                    //   return "Please enter a valid mobile number.";
                    // }
                    return null;
                  },
                ),
                SignUpField(
                  controller: _passController,
                  hint: "Password",
                  label: "Password",
                  icon: Icons.password,
                  forPassword: true,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Please create a strong password.";
                    }
                    if (val.length < 8) {
                      return "Your password must be atleast 8 characters long";
                    }

                    return null;
                  },
                ),
                SignUpField(
                  controller: _passConfirmController,
                  hint: "Confirm Password",
                  label: "Confirm Password",
                  icon: Icons.password,
                  forPassword: true,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Please confirm you password.";
                    }
                    if (val != _passController.text.trim()) {
                      return "Password does'nt match confirm password.";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 12),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 35, minWidth: 120),
                  child: OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateColor.resolveWith(
                        (_) => AppPalette.goldAccent,
                      ),
                      side: WidgetStateBorderSide.resolveWith(
                        (_) => BorderSide(color: AppPalette.goldAccent),
                      ),
                      shape: WidgetStateOutlinedBorder.resolveWith(
                        (_) => RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    onPressed: () {
                      print(signUpFormKey.currentState!.validate());
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: AppPalette.primaryBackground,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpField extends StatefulWidget {
  final String hint;
  final String label;
  final IconData icon;
  final bool forPassword;
  final double width;
  final TextEditingController controller;
  final Function(String?) validator;
  final TextInputType keyboardType;

  const SignUpField({
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
  State<SignUpField> createState() => _SignUpFieldState();
}

class _SignUpFieldState extends State<SignUpField> {
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
