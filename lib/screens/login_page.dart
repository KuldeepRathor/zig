import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:zig/main.dart';
import 'package:zig/screens/register_page.dart';
import 'package:zig/widgets/borderbox.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'forgot_password_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    @override
    void dispose() {
      emailController.dispose();
      passwordController.dispose();

      dispose();
    }

    Future signIn() async {
      // var emailController;
      // var passwordController;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        print(e);
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return Scaffold(
      backgroundColor: const Color(0xffF5F2F3),
      appBar: AppBar(
        backgroundColor: const Color(0xff7C68EE),
        iconTheme: const IconThemeData(
          color: CupertinoColors.white,
        ),
        title: const Text(
          "Login Page!",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset("assets/images/zigy.jpg"),
                    height: 200.0,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'ZIG!',
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        color: Color(0xff7C68EE),
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 2000),
                    ),
                  ],
                  totalRepeatCount: 4,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: emailController,
                    style: const TextStyle(),
                    obscureText: false,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    // validator: (email) =>
                    //     email != null && EmailValidator.validate(email)
                    //         ? "Enter a valid Email Address"
                    //         : null,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      hintText: "Your Email",
                      hintStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Color(0xff7C68EE),
                            width: 2,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: passwordController,
                    style: const TextStyle(),
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 8
                        ? "Enter min. 8 characters"
                        : null,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      hintText: "Password",
                      hintStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Color(0xff7C68EE),
                            width: 2,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    signIn();
                  },
                  child: BorderBox(
                    padding: const EdgeInsets.symmetric(),
                    width: 120,
                    height: 50,
                    color: const Color(0xff7C68EE),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.login,
                          color: Colors.white,
                        ),
                        Text(
                          'Log In',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ForgotPasswordPage();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueAccent,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'No Account?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const Registration_Page();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blueAccent,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
