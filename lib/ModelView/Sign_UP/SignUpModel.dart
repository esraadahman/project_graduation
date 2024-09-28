class SignUpModel {
  final bool status;
  final String message;

  SignUpModel({required this.status, required this.message});

  // Factory method to create an instance from JSON
  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
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