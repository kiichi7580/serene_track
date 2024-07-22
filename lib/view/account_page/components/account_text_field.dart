import 'package:flutter/material.dart';
import 'package:serene_track/constant/themes/text_styles.dart';

class AccountTextField extends StatelessWidget {
  const AccountTextField({
    super.key,
    required this.caption,
    required this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.maxLength,
    this.validator,
    this.onSaved,
  });
  final String caption;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLength;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(caption, style: TextStyles.caption),
        Container(
          padding: const EdgeInsets.only(
            top: 4,
            right: 8,
            left: 8,
            bottom: 4,
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            maxLength: maxLength,
            validator: validator,
            onSaved: onSaved,
          ),
        ),
      ],
    );
  }
}
