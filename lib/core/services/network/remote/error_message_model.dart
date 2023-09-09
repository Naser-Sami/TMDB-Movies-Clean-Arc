import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String message;
  final bool success;

  // final bool isSuccess;
  // final dynamic data;

  const ErrorMessageModel({
    required this.statusCode,
    required this.message,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json["status_code"] ?? 0,
      message: json["status_message"] ?? "",
      success: json["success"] ?? false,
    );
  }

  @override
  List<Object?> get props => [statusCode, message, success];
}
