import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/image_model.dart';

abstract class ImageState {
  const ImageState();
}

class ImageInitial extends ImageState {
  const ImageInitial();
}

class ImageLoading extends ImageState {
  const ImageLoading();
}

@immutable
class ImageLoaded extends ImageState {
  const ImageLoaded(this.image);
  final ImageModel image;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ImageLoaded && other.image == image;
  }

  @override
  int get hashCode => image.hashCode;
}

@immutable
class ImageError extends ImageState {
  const ImageError(this.failure);
  final Failure failure;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is ImageError && other.failure == failure;
  }

  @override
  int get hashCode => failure.hashCode;
}
