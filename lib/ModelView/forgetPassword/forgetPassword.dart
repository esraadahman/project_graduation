class forgetPasswordModel {
  final bool status;

  forgetPasswordModel({required this.status});

  // Factory method to create an instance from JSON
  factory forgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return forgetPasswordModel(
      status: json['status'],
    );
  }

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
    };
  }
}
