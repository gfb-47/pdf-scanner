import 'package:get_it/get_it.dart';

import '../../data/datasources/camera_data_source.dart';
import '../../data/datasources/export_pdf_data_source.dart';
import '../../data/datasources/gallery_data_source.dart';
import '../../data/repositories/export_pdf_repository_impl.dart';
import '../../data/repositories/get_image_repository_impl.dart';
import '../../domain/repositories/export_pdf_repository.dart';
import '../../domain/repositories/get_image_repository.dart';
import '../../domain/usecases/export_pdf.dart';
import '../../domain/usecases/pick_image.dart';
import '../../domain/usecases/take_picture.dart';
import '../features/crop_image/controller/crop_image_page_controller.dart';
import '../features/export_pdf/controller/export_pdf_controller.dart';
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
  sl.registerFactory(
    () => ExportPdfController(exportPdfRepository: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => PickImageUsecase(sl()));
  sl.registerLazySingleton(() => TakePictureUsecase(sl()));
  sl.registerLazySingleton(() => ExportPdfUsecase(sl()));

  // Repository
  sl.registerLazySingleton<IGetImageRepository>(
    () => GetImageRepository(
      cameraDatasource: sl(),
      galleryDatasource: sl(),
    ),
  );

  sl.registerLazySingleton<IExportPdfRepository>(
    () => ExportPdfRepository(
      exportPdfDatasource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ICameraDataSource>(
    () => CameraDatasource(),
  );

  sl.registerLazySingleton<IGalleryDatasource>(
    () => GalleryDatasource(),
  );

  sl.registerLazySingleton<IExportPdfDatasource>(
    () => ExportPdfDatasource(),
  );

  // //! Core
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
  // sl.registerLazySingleton(() => DataConnectionChecker());
}
