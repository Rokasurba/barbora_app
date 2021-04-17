import 'package:barbora_app/services/web_api/web_api.dart';
import 'package:get_it/get_it.dart';

import 'services/localstorage_service.dart';
import 'services/web_api/web_api_implementation.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  var instance = await LocalStorageService.getInstance();
  serviceLocator.registerSingleton<LocalStorageService>(instance);
  serviceLocator.registerLazySingleton<WebApi>(() => WebApiImpl());
}
