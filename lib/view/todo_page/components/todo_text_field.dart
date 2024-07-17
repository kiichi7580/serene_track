import 'package:flutter/material.dart';
import 'package:serene_track/constant/themes/text_styles.dart';

class TodoTextField extends StatelessWidget {
  const TodoTextField({
    super.key,
    required this.caption,
    required this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.maxLength,
    this.maxLines,
    this.hintText,
    this.validator,
    this.onSaved,
  });
  final String caption;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final bool obscureText;
  final int? maxLength;
  final int? maxLines;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          caption,
          style: TextStyles.caption,
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffF8F8F8),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            maxLength: maxLength,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
            ),
            validator: validator,
            onSaved: onSaved,
          ),
        ),
      ],
    );
  }
}
