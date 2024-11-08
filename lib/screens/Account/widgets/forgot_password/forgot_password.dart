import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taksis/colors.dart';

class ForgotPassword extends StatelessWidget {
  final Function() showLogin;

  ForgotPassword({super.key, required this.showLogin});

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/taksis_logo.png",
              height: 270,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          filter: { "#": RegExp(r'[0-9]') },
                          type: MaskAutoCompletionType.lazy),
                    ],
                    decoration: const InputDecoration(
                      prefixIcon:
                      Icon(Icons.phone, color: lightSecondaryColor),
                      labelText: 'phone Number',
                      labelStyle: TextStyle(color: lightSecondaryColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                      "* We will send you a message to set or reset\nyour new password",style: TextStyle(color: lightSecondaryColor),)
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
                width: 300,
                height: 50,
                child: MaterialButton(
                  onPressed: showLogin,
                  color: lightPrimaryColor,
                  textColor: lightSecondaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text("Submit"),
                )),
          ],
        ),
      ),
    );
  }
}
