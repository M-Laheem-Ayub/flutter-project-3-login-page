import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void isVisible() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? emailVerification(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid Email";
    }
    return null;
  }

  String? passwordVerification(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    if (!RegExp(r'[!@#\$&*~%^]').hasMatch(value)) {
      return 'Password must contain at least one special character (!@#\$&*~%^)';
    }
    return null;
  }

  void formVerification() {
    if (_formKey.currentState!.validate()) {
      print(_emailController.text.toString());
      print(_passwordController.text.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1d182b),
        appBar: AppBar(
          backgroundColor: Color(0xff1d182b),
          toolbarHeight: 120,
          title: Center(
            child: Text(
              "Login",
              style: TextStyle(color: Color(0xffe4dceb), fontSize: 40),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Center(child: Image.asset("assets/images/logo.png", width: 120)),
              SizedBox(height: 100),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 5.0,
                      ),
                      child: TextFormField(
                        validator: emailVerification,
                        controller: _emailController,
                        style: TextStyle(color: Color(0xff9c95a2)),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff282238),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Color(0xff9c95a2)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 5.0,
                      ),
                      child: TextFormField(
                        validator: passwordVerification,
                        controller: _passwordController,
                        style: TextStyle(color: Color(0xff9c95a2)),
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff282238),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Color(0xff9c95a2)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              isVisible();
                            },
                            icon:
                                _obscureText
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5737d9),
                  padding: EdgeInsets.symmetric(horizontal: 122, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  formVerification();
                },
                child: Text(
                  "Submit",
                  style: TextStyle(color: Color(0xff9c95a2), fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
