class EndPoint {
  static String baseUrl = "https://api.bridgeit.site/api/";
// static String baseUrl = "http://127.0.0.1:8000/api/";
  static String signIn = "login";
  static String signUp = "register";
  static String google = "register/google";
  static String github = "register/github";
  static String linkedIn = "register/linkedin";
  static String forgetPassword = "email/forget";
  static String otpCode = 'email/forget/check';
  static String createNewPassword = 'password/change';

  // static String deletePost(int id) {
  //   return "blogs/$id";
  // }


  // static String updateUserInfo(int id) {
  //   return "user/$id";//
  // }

  // static String updateUserPosts(int id_post) {
  //   return "blogs/update/$id_post";
  // }
}

class ApiKey {
  static String status = "status";
  static String message = "message";

  //sign up
  static String user = "user";
  static String id = "id";
  static String name = "name";

  static String email = "email";
  // static String job_title = "job_title"; //null
  // static String created_at = "created_at"; // null
  static String password = "password";
  static String passwordConfirmation = "password_confirmation";
  static String updatedAt = "updated_at"; //null
  static String token = "token";

//login
  static String type = "type";

  static String emailVerifiedAt = "email_verified_at";

  // static String image = "image";
  // static String imagePath = "image_path";

// add post
  static String content = "content";

// user info

  static String phone = "phone";
  //static String confirmPassword = "confirmPassword";
  // static String location = "location";
  // static String profilePic = "profilePic";

  //get all posts
  // static String data = "data";
  // static String title = "title";
  // static String description = "description";
  static String userId = "user_id";
}
