class LoginModel {
  final Data data;
  final Token token;

  LoginModel({
    required this.data,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      data: Data.fromJson(json['data']),
      token: Token.fromJson(json['token']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'token': token.toJson(),
    };
  }
}

class Data {
  final User1 user;

  Data({
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: User1.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
    };
  }
}

class User1 {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final String type;
  final String? phone;
  final String? userId;
  final String? avatar;

  User1({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
    this.phone,
    this.userId,
    this.avatar,
  });

  factory User1.fromJson(Map<String, dynamic> json) {
    return User1(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      type: json['type'],
      phone: json['phone'],
      userId: json['user_id'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'type': type,
      'phone': phone,
      'user_id': userId,
      'avatar': avatar,
    };
  }
}

class Token {
  final String accessToken;
  final String type;
  final String expiresIn;

  Token({
    required this.accessToken,
    required this.type,
    required this.expiresIn,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      accessToken: json['access_token'],
      type: json['type'],
      expiresIn: json['expires_in'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'type': type,
      'expires_in': expiresIn,
    };
  }
}
