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