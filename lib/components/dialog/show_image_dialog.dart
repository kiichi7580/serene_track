import 'package:flutter/material.dart';
import 'package:serene_track/gen/assets.gen.dart';

Future<void> showImageDialog({
  required BuildContext context,
  required String imageUrl,
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
