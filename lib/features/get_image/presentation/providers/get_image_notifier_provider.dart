import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/locator.dart';
import '../../../../core/navigator_service.dart';
import '../../../../core/routes/route_strings.dart';
import '../../data/models/image_model.dart';
import '../../domain/usecases/pick_image.dart';
import 'get_image_states.dart';

class GetImageNotifierProvider extends StateNotifier<ImageState> {
  GetImageNotifierProvider({required this.pickImageUsecase})
      : super(const ImageInitial());
  final PickImageUsecase pickImageUsecase;

  static final _navigationService = locator<NavigationService>();

  Future<void> pickImage(String image) async {
    state = const ImageLoading();
    final result =
        await pickImageUsecase(Params(image: ImageModel(imagePath: image)));
    result.fold(
      (l) {
        state = ImageError(l);
      },
      (r) {
        state = ImageLoaded(ImageModel(imagePath: ''));
        _navigationService.toNamed(RouteStrings.getImage, arguments: r);
      },
    );
  }
}
