import 'dart:io';

import 'package:restaurant_booking/model/response_model.dart';

enum ImageStateStatus { initial, loading, success, refresh, failed }

class ImageState {
  ImageStateStatus? status;
  ImageModel? imageModel;
  File? imageFile;

  ImageState._({
    this.status,
    this.imageModel,
    this.imageFile,
  });



  static ImageState initial = ImageState._(
    status: ImageStateStatus.initial,
    imageModel: null,
    imageFile: null,
  );

  ImageState loading() => copyWith(status: ImageStateStatus.loading);
  ImageState error() => copyWith(status: ImageStateStatus.failed);
  ImageState success() => copyWith(status: ImageStateStatus.success);
  ImageState refresh() => copyWith(status: ImageStateStatus.refresh);

  ImageState copyWith({
    ImageStateStatus? status,
    ImageModel? imageModel,
    File? imageFile,
  }) {
    return ImageState._(
      status: status ?? this.status,
      imageModel: imageModel ?? this.imageModel,
      imageFile: imageFile ?? this.imageFile,
    );
  }
}
