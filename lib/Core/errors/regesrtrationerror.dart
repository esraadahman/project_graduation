class RequiredFieldsErrorModel {
  // bool status;
  //MessageErrors message;

 // RequiredFieldsErrorModel({required this.status, required this.message});

//   factory RequiredFieldsErrorModel.fromJson(Map<String, dynamic> json) {
//     return RequiredFieldsErrorModel(
//       status: json['status'] ?? false,
//       message: MessageErrors.fromJson(json['message'] ?? {}),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'message': message.toJson(),
//     };
//   }
// }

// class MessageErrors {
//   List<String>? email;
//   List<String>? name;
//   List<String>? bio;
//   List<String>? password;
//   List<String>? image;

//   MessageErrors({
//     this.email,
//     this.name,
//     this.bio,
//     this.password,
//     this.image,
//   });

//   factory MessageErrors.fromJson(Map<String, dynamic> json) {
//     return MessageErrors(
//       email: List<String>.from(json['email'] ?? []),
//       name: List<String>.from(json['name'] ?? []),
//       bio: List<String>.from(json['bio'] ?? []),
//       password: List<String>.from(json['password'] ?? []),
//       image: List<String>.from(json['image'] ?? []),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'email': email ?? [],
//       'name': name ?? [],
//       'bio': bio ?? [],
//       'password': password ?? [],
//       'image': image ?? [],
//     };
//   }
}
