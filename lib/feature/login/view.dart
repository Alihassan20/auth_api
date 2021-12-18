import 'package:flutter/material.dart';

import '../../core/validate.dart';
import '../../widget/custom_textform.dart';
import '../../widget/snack_bar.dart';
import '../home/view.dart';
import 'controller.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  LoginController controller = LoginController();

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
              controller.isLoading
                  ? const Center(child:  CircularProgressIndicator())
                  : RaisedButton(
                  onPressed: () async {
                    setState(() => controller.isLoading = true);
                    final message = await controller.Login();
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
                  child: const Text("lOGIN")),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Don't Have Email Register Now?"),
                  TextButton(onPressed: () {}, child: const Text("SignUp",style: TextStyle(color: Colors.white),))
                ],
              )
            ],
          ),
        ),
      ),
    );

  }
}
