import 'package:flutter/material.dart';
import 'package:serene_track/gen/assets.gen.dart';

Future<void> showTaskCompleteDialog({
  required BuildContext context,
  String imageUrl =
      'https://hiyokoyarou.com/wp-content/uploads/2022/01/kurakka-piyo-1024x1024.png',
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: imageUrl == ''
            ? Image.asset(
                Assets.images.icons.sereneTrackIconBlack.path,
                fit: BoxFit.cover,
              )
            : Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
      );
    },
  );
}
