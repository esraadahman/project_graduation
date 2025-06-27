import 'package:gradution_project/Core/Imports/common_imports.dart';

class ErrorModel {
  //final bool  status;
  final String message;

  ErrorModel(
      {
      //required this.status,
      required this.message});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      //status: jsonData[ApiKey.status],
      message: jsonData[ApiKey.message],
    );
  }
}
