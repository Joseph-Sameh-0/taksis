import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taksis/colors.dart';

class Signup extends StatefulWidget {
  final Function() showLogin;

  const Signup({super.key, required this.showLogin});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/taksis_logo.png",
              height: 270,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: lightSecondaryColor),
                    controller: phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      MaskTextInputFormatter(
                          mask: '# ### ### ####',
                          filter: {"#": RegExp(r'[0-9]')},
                          type: MaskAutoCompletionType.lazy),
                    ],
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone, color: lightSecondaryColor),
                      labelText: 'phone Number',
                      labelStyle: TextStyle(color: lightSecondaryColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    style: TextStyle(color: lightSecondaryColor),
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.lock, color: lightSecondaryColor),
                      labelStyle: TextStyle(color: lightSecondaryColor),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: lightSecondaryColor,
                        ),
                      ),
                      labelText: 'Password',
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: confirmPasswordController,
                    style: TextStyle(color: lightSecondaryColor),
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.lock, color: lightSecondaryColor),
                      labelStyle: TextStyle(color: lightSecondaryColor),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: lightSecondaryColor,
                        ),
                      ),
                      labelText: 'Confirm Password',
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: TextButton(
                  //     onPressed: () {},
                  //     child: const Text(
                  //       "Forgot Password?",
                  //       style: TextStyle(color: Colors.red),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            // const SizedBox(height: 32),
            SizedBox(
              width: 300,
              height: 50,
              child: MaterialButton(
                color: lightPrimaryColor,
                textColor: lightSecondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: widget.showLogin,
                child: const Text("Sign up"),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Text(
                  "- OR Continue with -",
                  style: TextStyle(color: lightSecondaryColor),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Stack(
                          children: [
                            SvgPicture.asset('assets/icons/red_cycle.svg'),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                "assets/images/google.png",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Stack(
                          children: [
                            SvgPicture.asset('assets/icons/red_cycle.svg'),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset('assets/icons/apple.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Stack(
                          children: [
                            SvgPicture.asset('assets/icons/red_cycle.svg'),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child:
                                  SvgPicture.asset('assets/icons/facebook.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "I Already Have an Account",
                      style: TextStyle(color: lightSecondaryColor),
                    ),
                    TextButton(
                      onPressed: widget.showLogin,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.red,
                          decorationColor: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),

            // Text(
            //   "Sign Up Page",
            //   style: TextStyle(color: lightSecondaryColor),
            // ),
            // ElevatedButton(
            //   onPressed: () => widget.showLogin(),
            //   child: Text("Back to Login"),
            // ),
          ],
        ),
      ),
    );
  }
}
