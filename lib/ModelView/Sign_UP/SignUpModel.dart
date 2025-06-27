import 'package:gradution_project/ModelView/LoginModel/LoginModel.dart';

class GlobalResponse {
  final bool status;
  final String message;

  GlobalResponse({required this.status, required this.message});

  // Factory method to create an instance from JSON
  factory GlobalResponse.fromJson(Map<String, dynamic> json) {
    return GlobalResponse(
      status: json['status'],
      message: json['message'],
    );
  }

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }
}


class GlobalResponse2 {
  final String message;

  GlobalResponse2({ required this.message});

  // Factory method to create an instance from JSON
  factory GlobalResponse2.fromJson(Map<String, dynamic> json) {
    return GlobalResponse2(
      message: json['message'],
    );
  }

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}


class GlobalResponse3 {
  final bool success;
  final String message;

  GlobalResponse3({required this.success, required this.message});

  // Factory method to create an instance from JSON
  factory GlobalResponse3.fromJson(Map<String, dynamic> json) {
    return GlobalResponse3(
     success: json['success'],
      message: json['message'],
    );
  }

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }
}


class Signupmodel {
  final User1 user;
  final Token token;
  final String? message;
  final bool? status;

  Signupmodel({
    required this.user,
    required this.token,
    this.message,
    this.status,
  });

  factory Signupmodel.fromJson(Map<String, dynamic> json) {
    return Signupmodel(
      user: User1.fromJson(json['user']),
      token: Token.fromJson(json['token']),
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'token': token.toJson(),
      'message': message,
      'status': status,
    };
  }
}
