import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taksis/colors.dart';

class PersonalDetails extends StatefulWidget {

  PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        textStyle: TextStyle(color: lightSecondaryColor),
        color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Personal Details",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
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
                    filter: { "#": RegExp(r'[0-9]')},
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

            Align(
              alignment: Alignment.topRight,
              child: MaterialButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                child: Text(
                  "Change Password",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

