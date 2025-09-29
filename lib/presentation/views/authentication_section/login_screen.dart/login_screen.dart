import 'package:authority_tracker/presentation/controllers/auth_controller.dart';
import 'package:authority_tracker/presentation/views/shared/widgets/custom_button.dart';
import 'package:authority_tracker/presentation/views/shared/widgets/custom_textfield.dart';
import 'package:authority_tracker/utils/methods/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextfield(
              hintText: 'email',
              controller: emailController,
              validator: (p0) {
                if (isValidEmail(p0 ?? '')) {
                  return 'Enter valid email';
                }
                return null;
              },
            ),
            CustomTextfield(
              hintText: 'password',
              controller: passController,
              validator: (p0) {
                if ((p0 ?? '').trim().length < 6) {
                  return 'Incorred password';
                }
                return null;
              },
            ),
            Consumer<AuthController>(
              builder: (context, controller, _) {
                return CustomButton(
                  isLoading: controller.isloading,
                  label: 'Login',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      controller.login(
                        email: emailController.text,
                        password: passController.text,
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
