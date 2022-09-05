import 'package:equatable/equatable.dart';

class SchoolModel extends Equatable {
  final String schoolName;
  final String schoolCode;

  const SchoolModel({
    required this.schoolName,
    required this.schoolCode,
  });

  factory SchoolModel.fromJson(json) {
    String schoolName = json['SCHUL_NM'];
    String schoolCode = json['SD_SCHUL_CODE'];

    return SchoolModel(schoolName: schoolName, schoolCode: schoolCode);
  }

  @override
  List<Object?> get props => [schoolName, schoolCode];
}
