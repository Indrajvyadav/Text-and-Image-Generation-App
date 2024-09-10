import 'package:ai_generative_app/auth_pages/forgot_password.dart';
import 'package:ai_generative_app/auth_pages/signup_screen.dart';
import 'package:ai_generative_app/constants/pallete.dart';
import 'package:ai_generative_app/pages/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "", password = "";
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPass = TextEditingController();
  final _appSignIn = GlobalKey<FormState>();
  bool hidden = true;

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0),
            )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key: _appSignIn,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/log-animation.json', height: 100),
                      const SizedBox(height: 60),
                      const Text(
                        "Chat Sage",
                        style: TextStyle(
                            color: secColor,
                            fontSize: 36,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Watch your prompts come to life with awesome text and images!",
                          style: TextStyle(fontSize: 20, color: secColor),
                        ),
                      ),
                      const SizedBox(height: 50),
                      //Email TextField
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                style: const TextStyle(color: textColor),
                                controller: userEmail,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: textColor,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                        color: secColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            )),
                      ),
                      //Password Textfield
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                style: const TextStyle(color: textColor),
                                controller: userPass,
                                obscureText: hidden,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.password,
                                      color: textColor,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: hidden
                                          ? const Icon(Icons.visibility_off,
                                              color: textColor)
                                          : const Icon(Icons.visibility,
                                              color: textColor),
                                      onPressed: () {
                                        setState(() {
                                          hidden = !hidden;
                                        });
                                      },
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(
                                      color: secColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    )),
                              ),
                            )),
                      ),
                      //sign in button
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 70,
                        width: 400,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(textColor),
                                ),
                                onPressed: () {
                                  setState(() {
                                    email = userEmail.text.trim().toLowerCase();
                                    password = userPass.text.trim();
                                  });
                                  userLogin();
                                },
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ))),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPass()));
                            },
                            child: const Text(
                              "Forgot Password",
                              style: TextStyle(
                                  color: secColor, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      //Not a Member? Register Now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Not a member?',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AppSignUp()));
                            },
                            child: const Text(
                              ' Register now',
                              style: TextStyle(
                                  color: secColor, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*void signInWithGoogle() async {
  GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null) {
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    if (userCredential != null) {
      Navigator.of(_).push( MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}*/
