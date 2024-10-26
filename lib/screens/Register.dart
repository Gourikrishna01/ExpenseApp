import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                "https://th.bing.com/th/id/OIP._pFL2JstsDCcFh0mJqTx-gAAAA?rs=1&pid=ImgDetMain",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black
                  .withOpacity(0.5), // dark overlay for better text visibility
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            labelText: "Username",
                            labelStyle: TextStyle(color: Colors.white70),
                            prefixIcon: Icon(Icons.person, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          labelText: "Full Name",
                          labelStyle: TextStyle(color: Colors.white70),
                          prefixIcon:
                              Icon(Icons.person_2_rounded, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the email';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return "Please enter a valid email address";
                          }
                          // Ensure the domain does not end with ".c" or ".co"
                          if (value.endsWith(".c") || value.endsWith(".co")) {
                            return "Email domain cannot end with '.c' or '.co'";
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white70),
                          prefixIcon: Icon(Icons.mail, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }

                          // Minimum length of 8 characters
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }

                          // Check if password contains at least one uppercase letter
                          if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return 'Password must contain at least one uppercase letter';
                          }

                          // Check if password contains at least one lowercase letter
                          if (!RegExp(r'[a-z]').hasMatch(value)) {
                            return 'Password must contain at least one lowercase letter';
                          }

                          // Check if password contains at least one digit
                          if (!RegExp(r'\d').hasMatch(value)) {
                            return 'Password must contain at least one number';
                          }

                          // Check if password contains at least one special character
                          if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                              .hasMatch(value)) {
                            return 'Password must contain at least one special character';
                          }

                          return null; // If all checks pass
                        },
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white70),
                          prefixIcon: Icon(Icons.lock, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        }
                      },
                      color: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      minWidth: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.login, color: Colors.white),
                          const SizedBox(width: 10),
                          Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
