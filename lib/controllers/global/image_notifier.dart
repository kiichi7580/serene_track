import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

part 'image_notifier.freezed.dart';

@freezed
class ImageState with _$ImageState {
  factory ImageState({
    @Default('') String imageUrl,
    @Default(false) bool isLoading,
  }) = _ImageState;
  ImageState._();
}

final imageProvider = StateNotifierProvider<ImageController, ImageState>(
  (ref) {
    return ImageController();
  },
);

class ImageController extends StateNotifier<ImageState> {
  ImageController() : super(ImageState());

  Future<String?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      String imageUrl = await convertImagePermanently(pickedFile);
      state = state.copyWith(imageUrl: imageUrl);
      return imageUrl;
    }
    return null;
  }

  Future<String> convertImagePermanently(XFile pickedFile) async {
    final File image = File(pickedFile.path);
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final fileName = image.path.split('/').last;
    final newImage = await image.copy('$path/$fileName');
    return newImage.path;
  }
}
