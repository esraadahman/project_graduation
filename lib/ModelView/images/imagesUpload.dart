class UploadImageModel {
  final User_Image_Upload user;
  final String message;

  UploadImageModel({
    required this.user,
    required this.message,
  });

  factory UploadImageModel.fromJson(Map<String, dynamic> json) {
    return UploadImageModel(
      user: User_Image_Upload.fromJson(json['user']),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'message': message,
    };
  }
}

class User_Image_Upload {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? avatar;
  final String? bio;

  User_Image_Upload({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.avatar,
    this.bio,
  });

  factory User_Image_Upload.fromJson(Map<String, dynamic> json) {
    return User_Image_Upload(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
      bio: json['bio'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'bio': bio,
    };
  }
}
