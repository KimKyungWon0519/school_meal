import 'package:equatable/equatable.dart';

class ResultModel extends Equatable {
  final String code;
  final String message;
  final bool isSuccess;

  const ResultModel({
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  factory ResultModel.fromJson(json) {
    String code = json['CODE'];
    String message = json['MESSAGE'];
    bool isSuccess = false;

    if (int.parse(code.substring(code.length - 3)) <= 300) {
      isSuccess = true;
    } else {
      isSuccess = false;
    }

    return ResultModel(code: code, message: message, isSuccess: isSuccess);
  }

  @override
  List<Object?> get props => [code, message, isSuccess];
}
