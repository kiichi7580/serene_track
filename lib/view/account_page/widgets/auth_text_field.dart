import 'package:flutter/material.dart';
import 'package:serene_track/constant/themes/text_styles.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.caption,
    required this.controller,
    this.textInputType,
    this.obscureText = false,
    this.hintText,
    this.validator,
    this.onSaved,
  });
  final String caption;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final String? hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(caption, style: TextStyles.caption),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.only(
            top: 4,
            right: 8,
            left: 8,
            bottom: 4,
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: textInputType,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
            ),
            validator: validator,
            onSaved: onSaved,
          ),
        ),
      ],
    );
  }
}
