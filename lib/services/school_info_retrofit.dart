import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:school_meal/values/constants/base_url.dart';

part 'school_info_retrofit.g.dart';

@RestApi(baseUrl: BaseUrl.schoolInfoBaseUrl)
abstract class SchoolInfoRetrofit {
  factory SchoolInfoRetrofit(Dio dio, {String baseUrl}) = _SchoolInfoRetrofit;

  @GET(SchoolBaseUrl.defaultUrl)
  Future getAllSchool({
    @Query('pIndex') required int pIndex,
    @Query('SCHUL_NM') required String schoolName,
  });
}
