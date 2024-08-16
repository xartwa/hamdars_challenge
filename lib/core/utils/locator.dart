import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../home/services/home.dart';

const apiVersion = 'v4';
const apiBaseUrl = 'https://app.tarazorg.ir/api/qb/$apiVersion/';
GetIt locator = GetIt.instance;

Future<void> initLocator() async {
  locator.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: apiBaseUrl,
        contentType: 'application/json',
      ),
    ),
  );

  locator.registerLazySingleton<HomeServices>(
    () => HomeServices(),
  );
}
