import 'package:authority_tracker/config/route/route_names.dart';
import 'package:authority_tracker/presentation/controllers/auth_controller.dart';
import 'package:authority_tracker/presentation/views/shared/widgets/custom_button.dart';
import 'package:authority_tracker/presentation/views/shared/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var emailController = TextEditingController(text: 'Test@gmail.com');
  var passController = TextEditingController(text: 'test@123');
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(text: 'test');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Signup',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              CustomTextfield(hintText: 'Email', controller: emailController),
              CustomTextfield(
                hintText: 'Project name',
                controller: nameController,
              ),
              CustomTextfield(hintText: 'password', controller: passController),
              CustomTextfield(
                hintText: 're-password',
                controller: TextEditingController(text: 'test@123'),
                validator: (p0) {
                  return null;
                },
              ),
              Consumer<AuthController>(
                builder: (context, controller, _) {
                  return CustomButton(
                    isLoading: controller.isloading,
                    label: 'Signup',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        controller.signUp(
                          email: emailController.text,
                          password: passController.text,
                          projectName: nameController.text,
                        );
                      }
                      {}
                    },
                  );
                },
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'If you already have an account? ',
                    style: const TextStyle(fontSize: 13, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Login',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.goNamed(AppRouteNames.login);
                          },
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
