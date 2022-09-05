import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:school_meal/model/reponse_result.dart';
import 'package:school_meal/model/result_model.dart';
import 'package:school_meal/model/school_model.dart';
import 'package:school_meal/services/school_info_retrofit.dart';

class SchoolInfoRepository {
  late final SchoolInfoRetrofit _schoolInfoRetrofit;

  SchoolInfoRepository({
    required SchoolInfoRetrofit schoolInfoRetrofit,
  }) {
    _schoolInfoRetrofit = schoolInfoRetrofit;
  }

  Future<ResponseModel> getAllSchool(int pIndex, String schoolName) async {
    Map<String, dynamic> json =
        jsonDecode((await _schoolInfoRetrofit.getAllSchool(
      pIndex: pIndex,
      schoolName: schoolName,
    ))
            .toString());

    ResultModel resultModel;
    try {
      resultModel =
          ResultModel.fromJson(json['schoolInfo'][0]['head'][1]['RESULT']);
    } catch (_) {
      resultModel = ResultModel.fromJson(json['RESULT']);
    }

    ResponseModel responseModel;

    if (resultModel.isSuccess) {
      List<SchoolModel> schoolList = [];

      for (var rowJson in json['schoolInfo'][1]['row']) {
        schoolList.add(SchoolModel.fromJson(rowJson));
      }

      responseModel = ResponseModel<List<SchoolModel>>(
          result: resultModel, data: schoolList);
    } else {
      responseModel = ResponseModel(result: resultModel);
    }

    return responseModel;
  }
}
