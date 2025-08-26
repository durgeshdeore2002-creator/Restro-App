
import 'dart:developer' as log;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restro_code/View/home_screen.dart';
import 'package:restro_code/View/signup_sceen/signup_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;
  // _LoginPageState मध्ये:
    final FirebaseAuth _auth = FirebaseAuth.instance;
    bool _loading = false;


    Future<void> _login() async {
  setState(() => _loading = true);
  try {
    final email = emailController.text.trim();
    final pass  = passwordController.text.trim();
    log.log("${email} and $pass");

    await _auth.signInWithEmailAndPassword(email: email, password: pass);

    if (!mounted) return;
    // main.dart मधल्या StreamBuilder मुळे इथे push करण्याची गरज नाही,
    // तरी direct Home हवे असेल तर:
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
      
  } on FirebaseAuthException catch (e) {
    String msg;
    switch (e.code) {
      case 'user-not-found':
        msg = 'हा ईमेल नोंदणीकृत नाही.';
        break;
      case 'wrong-password':
        msg = 'पासवर्ड चुकीचा आहे.';
        break;
      case 'invalid-email':
        msg = 'ईमेल वैध नाही.';
        break;
      case 'user-disabled':
        msg = 'हा खाते निष्क्रिय आहे.';
        break;
      default:
        msg = e.message ?? 'Login अयशस्वी.';
    }
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  } finally {
    if (mounted) setState(() => _loading = false);
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// App Logo / Title
                const Icon(Icons.restaurant_menu, size: 80, color: Colors.blue),
                const SizedBox(height: 16),
                const Text(
                  "Restaurant Billing",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),

                /// Mobile Number
                TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email Address",
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
                const SizedBox(height: 16),

                /// Password
                TextFormField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                /// Login Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  // onPressed: () {
                  //   if (_formKey.currentState!.validate()) {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(content: Text("Logging in...")),
                  //     );
                  //     // TODO: Firebase Auth login logic here

                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => const HomePage(),
                  //       ),
                  //     );
                  //   }
                  // },

                  
                onPressed: _loading
                  ? null
                  : () {
                      if (_formKey.currentState!.validate()) {
                        _login();
                      }
                      
                    },
                    



                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 16),

                /// Signup Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupPage()),
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
