import 'package:get_it/get_it.dart';

import '../../data/datasources/camera_data_source.dart';
import '../../data/datasources/gallery_data_source.dart';
import '../../data/repositories/get_image_repository_impl.dart';
import '../../domain/repositories/get_image_repository.dart';
import '../../domain/usecases/pick_image.dart';
import '../../domain/usecases/take_picture.dart';
import '../features/crop_image/controller/crop_image_page_controller.dart';
import '../features/get_image/controller/get_image_page_controller.dart';
import 'navigator_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => NavigationService());

  //Features
  sl.registerFactory(
    () => GetImagePageController(getImageRepository: sl()),
  );
  sl.registerFactory(
    () => CropImagePageController(),
  );

  // Use cases
  sl.registerLazySingleton(() => PickImageUsecase(sl()));
  sl.registerLazySingleton(() => TakePictureUsecase(sl()));

  // Repository
  sl.registerLazySingleton<IGetImageRepository>(
    () => GetImageRepository(
      cameraDatasource: sl(),
      galleryDatasource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ICameraDataSource>(
    () => CameraDatasource(),
  );

  sl.registerLazySingleton<IGalleryDatasource>(
    () => GalleryDatasource(),
  );

  // //! Core
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
  // sl.registerLazySingleton(() => DataConnectionChecker());
}