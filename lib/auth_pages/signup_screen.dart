import 'package:ai_generative_app/constants/pallete.dart';
import 'package:ai_generative_app/pages/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppSignUp extends StatefulWidget {
  const AppSignUp({super.key});

  @override
  State<AppSignUp> createState() => _AppSignUpState();
}

class _AppSignUpState extends State<AppSignUp> {
  String email = "", password = "";
  TextEditingController userName = TextEditingController();
  TextEditingController userMobile = TextEditingController();
  TextEditingController userPass = TextEditingController();
  TextEditingController userConfirm = TextEditingController();
  final _appSignUp = GlobalKey<FormState>();

  registration() async {
    if (userPass.text != "" && userName.text != "") {
      try {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Registered Successfully",
          style: TextStyle(fontSize: 20.0),
        )));
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: const IconThemeData(
          color: secColor,
        ),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Form(
        key: _appSignUp,
        child: Align(
          child: ListView(
            children: [
              SizedBox(
                height: 200,
                child: Lottie.asset('assets/log-animation.json'),
              ),
              //Username TextFormfield
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: userName,
                  validator: (username) {
                    if (username != null && username.isEmpty) {
                      return "Enter your Email Address";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        color: textColor,
                      ),
                      hintStyle: const TextStyle(color: secColor),
                      hintText: "Email",
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey))),
                ),
              ),
              // Mobile number
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  controller: userMobile,
                  validator: (usermobile) {
                    if (usermobile != null && usermobile.isEmpty) {
                      return "Enter your Mobile number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.phone_android,
                        color: textColor,
                      ),
                      hintText: "Mobile No",
                      hintStyle: const TextStyle(color: secColor),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey))),
                ),
              ),
              //Password
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: userPass,
                  validator: (userpass) {
                    if (userpass != null && userpass.isEmpty) {
                      return "Enter the Password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.password,
                        color: textColor,
                      ),
                      hintStyle: const TextStyle(color: secColor),
                      hintText: "Password",
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey))),
                ),
              ),
              //Confirm Password
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: userConfirm,
                  validator: (userpassconf) {
                    if (userpassconf != null && userpassconf.isEmpty) {
                      return "Confirm the Password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.password,
                        color: textColor,
                      ),
                      hintText: "Confirm Password",
                      hintStyle: const TextStyle(color: secColor),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey))),
                ),
              ),
              //SignUp Button
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_appSignUp.currentState!.validate()) {
                          setState(() {
                            email = userName.text;
                            password = userPass.text;
                          });
                          registration();
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                        textColor,
                      )),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
