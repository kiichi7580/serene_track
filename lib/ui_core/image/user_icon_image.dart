import 'dart:io';

import 'package:flutter/material.dart';
import 'package:serene_track/gen/assets.gen.dart';

ImageProvider<Object> userIconImage(String? url) {
  if (url == null || url.isEmpty) {
    return AssetImage(
      Assets.images.icons.sereneTrackIconBlack.path,
    ) as ImageProvider;
  } else {
    return FileImage(File(url));
  }
}
