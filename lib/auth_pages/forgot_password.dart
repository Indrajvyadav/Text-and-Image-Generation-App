import 'package:ai_generative_app/auth_pages/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  String email = "";
  TextEditingController userEmail = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "Password reset has been sent",
        style: TextStyle(fontSize: 20),
      )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "No User found",
          style: TextStyle(fontSize: 20),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 234, 234),
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg_img/forgot_pass.svg',
                  height: 150,
                ),
                const SizedBox(height: 50),
                const Text(
                  "Password Recovery",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Enter your mail",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),

                // Email Text Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: userEmail,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              border: InputBorder.none,
                              hintText: 'Email'),
                        ),
                      )),
                ),
                //Send email button
                const SizedBox(height: 20),
                SizedBox(
                  height: 70,
                  width: 400,
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.deepPurple),
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {}
                            setState(() {
                              email = userEmail.text;
                            });
                            resetPassword();
                          },
                          child: const Text(
                            'Send Email',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ))),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Not a Member? Register Now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account ?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AppSignUp()));
                      },
                      child: const Text(
                        ' Create',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
