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
