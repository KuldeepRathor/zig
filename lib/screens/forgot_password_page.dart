import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zig/widgets/borderbox.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    @override
    void dispose() {
      emailController.dispose();

      super.dispose();
    }

    Future resetPassword() async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
        const Center(
          child: CircularProgressIndicator(),
        ),
      );
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
            email: emailController.text.trim(),

            // Navigator.of(context).popUntil((route) => route.isFirst);
        );
      } on FirebaseAuthException catch (e) {
        print(e);

        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xffF5F2F3),
      appBar: AppBar(
        backgroundColor: const Color(0xff7C68EE),
        iconTheme: const IconThemeData(
          color: CupertinoColors.white,
        ),
        title: const Text(
          "Forgot Password",
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
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: TextFormField(
                    controller: emailController,
                    style: const TextStyle(),
                    obscureText: false,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    // validator: (email) =>
                    // email != null && EmailValidator.validate(email)
                    //     ? "Enter a valid Email Address"
                    //     : null,
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
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    resetPassword();
                  },
                  child: BorderBox(
                    padding: const EdgeInsets.symmetric(),
                    width: 200,
                    height: 50,
                    color: const Color(0xff7C68EE),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                        Text(
                          'Rest Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
