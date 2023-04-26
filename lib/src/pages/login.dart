import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stockly/src/utils/user_data.dart';

import '../utils/authentication.dart';
import '../utils/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Center(
                      child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image(image: AssetImage('lib/src/assets/images/logo.png')),
                  )),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text('Stockly',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 170),
                  child: const Text('Your email address',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                ),
                Container(
                  width: 360,
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      hintText: 'abcd@gmail.com',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 170),
                  child: const Text('Enter your password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                ),
                Container(
                  width: 360,
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.circular(20)),
                  width: 360,
                  child: TextButton(
                    onPressed: () {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter all the fields'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      if (passwordController.text.length < 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Password must be atleast 6 characters'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      
                      Auth().signInWithEmailAndPassword(emailController.text, passwordController.text, context)
                          .then(() {
                        Navigator.pushNamed(context, StocklyRoutes.homeRoute);
                      });
                    },
                    child: const Text('Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 1,
                        color: Colors.grey,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: const Text('OR',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            )),
                      ),
                      Container(
                        width: 150,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ],
                  )
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  width: 360,
                  child: TextButton(
                    onPressed: () {
                      Auth().signInWithGoogle(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Image(
                            image: AssetImage('lib/src/assets/images/google_logo.png'),
                            height: 20,
                            width: 20,
                          ),
                        ),
                        const Text('Sign-in with Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  width: 360,
                  child: TextButton(
                    onPressed: () {
                     // ! TODO: Add phone authentication
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Image(
                            image: AssetImage('lib/src/assets/images/phone_icon.png'),
                            height: 20,
                            width: 20,
                          ),
                        ),
                        const Text('Sign-in with Phone',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('New User?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, StocklyRoutes.signupRoute);
                        },
                        child: const Text('Sign-Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            )),
                      ),
                    ],
                  )
                )
        ],
      ),
      backgroundColor: const Color.fromARGB(1, 30, 30, 30),
    );
  }
}