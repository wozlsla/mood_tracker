import 'package:flutter/material.dart';
import 'package:mood_tracker/constants/gaps.dart';
import 'package:mood_tracker/widgets/form_button.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "signup";
  static const routeURL = "/signup";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() {
    // print("Form Data: $formData");
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        setState(() {});
        _formKey.currentState!.save();
      }
    }
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Center(
                    child: SizedBox(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          autocorrect: false,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return "Please check again";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            if (newValue != null) {
                              formData["user"] = newValue;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Username, email or mobile number",
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 0.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 0.5,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red.shade800,
                                width: 0.5,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red.shade600,
                              ),
                            ),
                          ),
                        ),
                        Gaps.v16,
                        TextFormField(
                          autocorrect: false,
                          obscureText: true,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return "Please check password again";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            if (newValue != null) {
                              formData["password"] = newValue;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 0.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 0.5,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red.shade800,
                                width: 0.5,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red.shade600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _onSubmitTap,
                        child: FormButton(text: "Submit", filled: true),
                      ),
                      Gaps.v4,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
