import 'package:authority_tracker/presentation/controllers/auth_controller.dart';
import 'package:authority_tracker/presentation/views/shared/widgets/custom_button.dart';
import 'package:authority_tracker/presentation/views/shared/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
          ],
        ),
      ),
    );
  }
}
