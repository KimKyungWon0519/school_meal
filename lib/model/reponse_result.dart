import 'package:equatable/equatable.dart';
import 'package:school_meal/model/result_model.dart';

class ResponseModel<T> extends Equatable {
  final ResultModel result;
  final T? data;

  const ResponseModel({
    required this.result,
    this.data,
  });

  @override
  List<Object?> get props => [result, data];
}
