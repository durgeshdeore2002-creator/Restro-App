
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restro_code/View/login_screen/login.dart';

/// --------------------
/// Signup Page
/// --------------------



class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _loading = false;


  Future<void> _signup() async {
  setState(() => _loading = true);
  try {
    final email = emailController.text.trim();
    final pass  = passwordController.text.trim();

    await _auth.createUserWithEmailAndPassword(email: email, password: pass);

    // (Optional) ईमेल व्हेरिफिकेशन पाठवायचा असल्यास:
    // await _auth.currentUser?.sendEmailVerification();

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Account created successfully")),
    );

    // साइनअप नंतर थेट Home ला न्यायचे असल्यास:
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
    // किंवा Login ला परत:
    Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
    String msg;
    switch (e.code) {
      case 'email-already-in-use':
        msg = 'हा ईमेल आधीच वापरला गेला आहे.';
        break;
      case 'invalid-email':
        msg = 'ईमेल वैध नाही.';
        break;
      case 'weak-password':
        msg = 'पासवर्ड थोडा मजबूत करा (किमान 6 अक्षरे).';
        break;
      default:
        msg = e.message ?? 'Signup अयशस्वी.';
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
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

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
                controller: mobileController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: "Mobile Number",
                  hintText: "Enter your mobile number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.phone_android),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Mobile number is required";
                  } else if (value.length != 10) {
                    return "Enter valid 10-digit number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

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
              const SizedBox(height: 16),

              /// Confirm Password
              TextFormField(
                controller: confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Confirm password is required";
                  } else if (value != passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              /// Signup Button
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
                //       const SnackBar(content: Text("Account Created")),
                //     );
                //     // TODO: Firebase signup logic here

                //     Navigator.pop(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const LoginPage()
                //       ),
                //     );
                //   }
                // },

                  onPressed: _loading
                  ? null
                  : () {
                      if (_formKey.currentState!.validate()) {
                        _signup();
                      }
                    },


                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
