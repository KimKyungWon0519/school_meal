import 'package:flutter/material.dart';
import 'package:school_meal/model/reponse_result.dart';
import 'package:school_meal/model/school_model.dart';
import 'package:school_meal/repositories/school_info_repository.dart';

class SchoolSearchProvider extends ChangeNotifier {
  late final SchoolInfoRepository _schoolInfoRepository;

  String _schoolName = '';
  List<SchoolModel> _schoolList = [];
  int _pIndex = 1;

  SchoolSearchProvider({
    required SchoolInfoRepository schoolInfoRepository,
  }) {
    _schoolInfoRepository = schoolInfoRepository;
  }

  Future<List<SchoolModel>> getAllSchool() async {
    ResponseModel responseModel = await _schoolInfoRepository.getAllSchool(
      _pIndex,
      _schoolName,
    );

    if (responseModel.result.isSuccess) {
      _schoolList.addAll(responseModel.data);
      return _schoolList;
    } else {
      return [];
    }
  }

  void increasePage() {
    _pIndex++;
    notifyListeners();
  }

  set schoolName(String schoolName) {
    _initValues();
    _schoolName = schoolName;
    notifyListeners();
  }

  void _initValues() {
    _pIndex = 1;
    _schoolList = [];
    _schoolName = '';
  }
}
