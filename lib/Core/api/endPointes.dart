class EndPoint {
  static String baseUrl =
      "https://bridge-it-backend-main-tfxagd.laravel.cloud/api/";
  // static String baseUrl = "https://api.bridgeit.site/api/";
// static String baseUrl = "http://127.0.0.1:8000/api/";
  static String signIn = "login";
  static String signUp = "register";
  static String google = "register/google";
  static String github = "register/github";
  static String linkedIn = "register/linkedin";
  static String forgetPassword = "email/forget";
  static String otpCode = 'email/forget/check';
  static String createNewPassword = 'password/change';
  static String CreateGroup = 'groups/store';
  static String UpdateGroup = 'groups/update';
  static String AllGroups = 'groups';
  static String CreateTaskChallange = "task/challenge";

  static String getGroupByID(int id) {
    return "groups/$id";
  }

  static String getTaskGroupID(int id) {
    return "$id/tasks";
    //return "groups/$id/tasks";
  }

  static String deleteGroup(int id) {
    return "groups/destroy?groupId=$id";
  }

  static String getMembersGroup(int id) {
    return "groups/$id/members";
  }

  static String UpdateTask(int idgroup, int idtask) {
    return "$idgroup/tasks/$idtask";
  }

  static String updateTaskStatus(int idtask) {
    return "tasks/updateStatus/$idtask";
  }

  static String getTaskChallanges(int idtask) {
    return "task/challenges/$idtask";
  }

  //unit/challenge/1
  //https://bridge-it-backend-main-tfxagd.laravel.cloud/api/task/challenge/${selectedChallengeId}
  static String deleteChallnge(int idChallange) {
    return "task/challenge/$idChallange";
  }

  static String UpdateChallnge(int idChallange) {
    return "task/challenge/$idChallange/edit";
  }
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
  static String d_token = "device_token";

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
  static String C_W_title = "title";
  static String C_W_description = "description";
  static String C_W_stage = "stage";
  static String C_W_deadline = "deadline";

  static String ass_to = "assigned_to";
  static String deadline = "deadline_date";
  static String group_id = "group_id";
  static String Urgency = "Urgency";
  static String task_id = "task_id";
  static String challenge_title = "challenge_title";
  static String challenge_solution = "challenge_solution";
}
