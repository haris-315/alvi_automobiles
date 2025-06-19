import 'package:alvi_automobiles/core/functions/email_verification.dart';
import 'package:alvi_automobiles/core/services/snackbar_service/snackbar_service.dart';
import 'package:alvi_automobiles/presentation/state_management/auth/cubit/auth_cubit.dart';
import 'package:alvi_automobiles/presentation/ui/pages/home/home_screen.dart';
import 'package:alvi_automobiles/presentation/ui/theme/palette/app_palette.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/common/alvi_appbar.dart';
import 'package:alvi_automobiles/presentation/ui/widgets/common/fields/auth_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoaded) {
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: AlviHome(),
            ),
          );
        }
        if (state is AuthError) {
          SnackbarService(
            context,
            snackbarType: SnackbarType.ERROR,
            details: "We are having some issue while signing you in.",
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppPalette.scaffoldBackground,
        appBar: alviAppBar(title: "Sign In"),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 28),
            Center(child: Image.asset("assets/alvi_no_bg.gif", width: 160)),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 28.0,
                horizontal: 12,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    AuthInputField(
                      controller: emailController,
                      hint: "Email",
                      label: "Email",
                      icon: Icons.email,
                      validator: (String? val) {
                        if (val == null || val.isEmpty) {
                          return "Email is required!";
                        }
                        if (!isValidEmail(val)) {
                          return "Please enter a valid email address.";
                        }
                        return null;
                      },
                    ),
                    AuthInputField(
                      controller: passController,
                      hint: "Password",
                      label: "Password",
                      forPassword: true,
                      icon: Icons.lock,
                      validator: (String? val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter you password.";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 35,
                            minWidth: 120,
                          ),
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

                            onPressed:
                                state is AuthLoading
                                    ? null
                                    : () {
                                      if (formKey.currentState!.validate()) {
                                        context.read<AuthCubit>().signIn(
                                          email: emailController.text.trim(),
                                          password: passController.text.trim(),
                                        );
                                      }
                                    },
                            child:
                                state is AuthLoading
                                    ? SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator(
                                        color: AppPalette.scaffoldBackground,
                                      ),
                                    )
                                    : Text(
                                      "Sign In",
                                      style: TextStyle(
                                        color: AppPalette.primaryBackground,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
