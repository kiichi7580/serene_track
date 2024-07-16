import 'package:flutter/material.dart';
import 'package:serene_track/constant/colors.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog({
    this.title = '',
    this.titleBackgroundColor = backGroundColor,
    this.content,
    this.actions,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
    Key? key,
  }) : super(key: key ?? UniqueKey());

  final String? title;
  final Color titleBackgroundColor;
  final Widget? content;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backGroundColor,
      title: Container(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          title ?? '',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      titlePadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: content,
      ),
      contentPadding: contentPadding,
      actions: actions,
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actionsPadding: const EdgeInsets.symmetric(vertical: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
