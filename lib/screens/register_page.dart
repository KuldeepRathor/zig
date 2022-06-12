import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zig/screens/login_page.dart';
import '../main.dart';
import '../widgets/borderbox.dart';

class Registration_Page extends StatefulWidget {
  const Registration_Page({Key? key}) : super(key: key);

  @override
  State<Registration_Page> createState() => _Registration_PageState();
}

class _Registration_PageState extends State<Registration_Page> {
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();

    @override
    void dispose() {
      emailController.dispose();
      passwordController.dispose();

      dispose();
    }

    Future signUp() async {
      final isValid = formkey.currentState!.validate();
      if (!isValid) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
        backgroundColor: Color(0xff7C68EE),
        iconTheme: const IconThemeData(
          color: CupertinoColors.white,
        ),
        title: const Text(
          "Registration Page",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 100,
                      child: Image.asset("assets/images/zigy.jpg"),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextField(
                      controller: nameController,
                      style: const TextStyle(),
                      obscureText: false,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        hintText: "Your Name",
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
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
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Color(0xff7C68EE),
                              width: 2,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
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
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Color(0xff7C68EE),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  InkWell(
                    onTap: () {
                      signUp();
                    },
                    child: BorderBox(
                      padding: const EdgeInsets.symmetric(),
                      width: 120,
                      height: 50,
                      color: Color(0xff7C68EE),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                          Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an Account?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
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
                                return const LoginPage();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
