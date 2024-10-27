import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

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
      state = state.copyWith(imageUrl: pickedFile.path);
      return pickedFile.path;
    }
    return null;
  }
}
