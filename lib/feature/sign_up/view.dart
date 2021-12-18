import 'package:auth_api_firebase/core/validate.dart';
import 'package:auth_api_firebase/feature/home/view.dart';
import 'package:flutter/material.dart';

import '../../widget/custom_textform.dart';
import '../../widget/snack_bar.dart';
import 'controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

SignUpController controller = SignUpController();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: ListView(
            children: [
              TextFormByField(
                inputTxt: TextInputType.emailAddress,
                hint: "email",
                color: Colors.white10,
                validator: Validator.email,
                onSaved: (v) => controller.email = v!,
              ),
              const SizedBox(height: 20),
              TextFormByField(
                inputTxt: TextInputType.number,
                hint: "password",
                color: Colors.white10,
                validator: Validator.password,
                onSaved: (v) => controller.password = v!,
              ),
              const SizedBox(height: 20),
              TextFormByField(
                inputTxt: TextInputType.number,
                hint: "Confirm password",
                color: Colors.white10,
                validator: Validator.confirmPassword,
                onSaved: (v) => controller.password = v!,
              ),
              const SizedBox(height: 20),
              controller.isLoading
                  ? const CircularProgressIndicator()
                  : RaisedButton(
                      onPressed: () async {
                        setState(() => controller.isLoading = true);
                        final message = await controller.signUp();
                        if (message == 'ok') {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ));
                        } else if (message != null && message.isNotEmpty) {
                          print(message);
                          showSnackBar(context, message, isError: true);
                        }
                        setState(() => controller.isLoading = false);
                        print("----------------");

                        print(message);
                      },
                      child: const Text("SignUp")),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text("Do You Have An Email?"),
                  TextButton(onPressed: () {}, child: const Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
