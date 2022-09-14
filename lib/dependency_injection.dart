import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:school_meal/controllers/search_provider.dart';
import 'package:school_meal/repositories/school_info_repository.dart';
import 'package:school_meal/services/school_info_retrofit.dart';
import 'package:school_meal/values/constants/api_keys.dart';

final instance = GetIt.instance;

void setup() {
  instance.registerLazySingleton(() => Dio(BaseOptions(queryParameters: {
        'KEY': ApiKeys.neisKey,
        'TYPE': 'json',
      })));
  instance.registerLazySingleton(() => SchoolInfoRetrofit(instance<Dio>()));
  instance.registerLazySingleton(() =>
      SchoolInfoRepository(schoolInfoRetrofit: instance<SchoolInfoRetrofit>()));
  instance.registerLazySingleton(() => SchoolSearchProvider(
      schoolInfoRepository: instance<SchoolInfoRepository>()));
}
