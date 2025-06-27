import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:gradution_project/ModelView/AllTasks/AllTasks.dart';
import 'package:gradution_project/ModelView/Task/task.dart';
import 'package:gradution_project/ModelView/allUsers/inviteModel.dart';
import 'package:gradution_project/ModelView/Group/SingleGroupModel.dart';

class Userrepo {
  final ApiConsumer api;

  Userrepo({required this.api});

  static final Box box = Hive.box(HiveConstants.Boxname);

  Future<Either<String, Groupcreate>> AddWorkSpace({
    required String title,
    required String des,
    required String stage,
    required String deadline,
  }) async {
    try {
      final response = await api.post(
        EndPoint.CreateGroup,
        data: {
          ApiKey.C_W_title: title,
          ApiKey.C_W_description: des,
          ApiKey.C_W_stage: stage,
          ApiKey.C_W_deadline: deadline,
        },
        isFromData: true,
      );

      final user = Groupcreate.fromJson(response);
      print(
          "${user.status}  ${user.group!.description} ${user.group!.title}  ${user.group!.stage}  ${user.group!.deadline}");
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, CreateTaskResponse>> AddTask({
    required String title,
    required String des,
    required int assigned_to,
    required String deadline_date,
    required int group_id,
    required String Urgency,
  }) async {
    try {
      print('Title: $title');
      print('Assigned: $assigned_to');
      print('Urgency: $Urgency');
      print('Description: $des');
      print('Deadline: $deadline_date');
      print('Group ID: $group_id');
      final response = await api.post(
        EndPoint.getTaskGroupID(group_id),
        data: {
          ApiKey.C_W_title: title,
          ApiKey.C_W_description: des,
          ApiKey.ass_to: assigned_to,
          ApiKey.deadline: deadline_date,
          ApiKey.group_id: group_id,
          ApiKey.Urgency: Urgency,
        },
        isFromData: true,
      );

      final user = CreateTaskResponse.fromJson(response);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, AllGroups>> getAllGroups() async {
    try {
      //throw ServerException(errModel: ErrorModel(message: "wwwww"));
      final response = await api.get(
        EndPoint.AllGroups,
      );

      final user = AllGroups.fromJson(response);

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, SingleGroupModel>> getGroupByID(int id) async {
    try {
      //   throw ServerException(errModel: ErrorModel(message: "wwwww"));
      final response = await api.get(EndPoint.getGroupByID(id));
      final singleGroup = SingleGroupModel.fromJson(response);
      return Right(singleGroup);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, GlobalResponse>> deleteGroup(int id) async {
    try {
      // throw ServerException(errModel: ErrorModel(message: "wwwww"));

      final response = await api.delete(EndPoint.deleteGroup(id));

      final singleGroup = GlobalResponse.fromJson(response);

      return Right(singleGroup);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, AllTasks>> getGroupTasks(int id) async {
    try {
      //throw ServerException(errModel: ErrorModel(message: "wwwww"));
      final response = await api.get(
        EndPoint.getTaskGroupID(id),
      );

      final user = AllTasks.fromJson(response);

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, GroupMembers>> getMembers(int id) async {
    try {
      final response = await api.get(
        EndPoint.getMembersGroup(id),
      );

      final user = GroupMembers.fromJson(response);

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, CreateTaskResponse>> UpdateTaskFunction({
    required String title,
    required String des,
    required int assigned_to,
    required String deadline_date,
    required int group_id,
    required String Urgency,
    required int idtask,
  }) async {
    try {
      print('Title: $title');
      print('Assigned: $assigned_to');
      print('Urgency: $Urgency');
      print('Description: $des');
      print('Deadline: $deadline_date');
      print('Group ID: $group_id');
      final response = await api.put(
        EndPoint.UpdateTask(group_id, idtask),
        data: {
          ApiKey.C_W_title: title,
          ApiKey.C_W_description: des,
          ApiKey.ass_to: assigned_to,
          ApiKey.deadline: deadline_date,
          ApiKey.group_id: group_id,
          ApiKey.Urgency: Urgency,
        },
        //  isFromData: true,
      );

      final user = CreateTaskResponse.fromJson(response);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, GlobalResponse2>> deleteTask(
      int groupid, int taskid) async {
    try {
      final response = await api.delete(EndPoint.UpdateTask(groupid, taskid));

      final singleGroup = GlobalResponse2.fromJson(response);

      return Right(singleGroup);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, UpdateStatus>> updateTaskStatus(
      {required String status,
      required int group_id,
      required int taskId}) async {
    try {
      final response = await api.post(
        EndPoint.updateTaskStatus(group_id),
        data: {
          ApiKey.status: status,
        },
        isFromData: true,
      );

      final user = UpdateStatus.fromJson(response);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, GlobalResponse3>> AddTaskChallange(
      {required String title, required String des, required int taskid}) async {
    try {
      final response = await api.post(
        EndPoint.CreateTaskChallange,
        data: {
          ApiKey.task_id: taskid,
          ApiKey.challenge_title: title,
          ApiKey.challenge_solution: des,
        },
      );

      final user = GlobalResponse3.fromJson(response);

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, Getchallenges>> getTaskChallanges(int taskid) async {
    try {
      final response = await api.get(
        EndPoint.getTaskChallanges(taskid),
      );

      final user = Getchallenges.fromJson(response);

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, GlobalResponse3>> deleteChallange(
      int idChallange) async {
    try {
      final response = await api.delete(EndPoint.deleteChallnge(idChallange));

      final singleGroup = GlobalResponse3.fromJson(response);

      return Right(singleGroup);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, GlobalResponse3>> updateChallange(
      {required String title,
      required String des,
      required int challengeid}) async {
    try {
      final response = await api.put(
        EndPoint.UpdateChallnge(challengeid),
        data: {
          ApiKey.challenge_title: title,
          ApiKey.challenge_solution: des,
        },
      );

      final user = GlobalResponse3.fromJson(response);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, Downloaddoc1Model>> DownloadDoc1(
      {required int groupid}) async {
    try {
      final response = await api.post(
        EndPoint.downloadDoc1(groupid),
        data: {},
      );

      final user = Downloaddoc1Model.fromJson(response);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, DownloadDoc2Model>> downloadDoc2(
      List<TaskItem> tasks) async {
    try {
      final response = await api.post(
        EndPoint.downloadDoc2,
        data: {
          "tasks": tasks.map((e) => e.toJson()).toList(),
        },
      );

      final model = DownloadDoc2Model.fromJson(response);
      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, AllUsersModel>> getAllUsers() async {
    try {
      final response = await api.get(
        EndPoint.getAllUsers,
      );

      final user = AllUsersModel.fromJson(response);

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, Invitemodel>> inviteUserToGroup(
      {required int groupid, required int userid}) async {
    try {
      final response = await api.get(
        EndPoint.addUserToGroup(groupid, userid),
      );

      final user = Invitemodel.fromJson(response);

      if (response['status'] == true) {
        return Right(user);
      } else if (response['message'] == 'User already in group') {
        return Left('User already in group');
      } else {
        return Left('Failed to invite user');
      }
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, UserDataModel>> getUserData() async {
    try {
      final response = await api.get(
        EndPoint.userData,
      );

      final user = UserDataModel.fromJson(response);

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, GlobalResponse2>> DeleteAcount(String password) async {
    try {
      final response = await api.delete(
        EndPoint.deleteAcount,
        data: {
          ApiKey.password: password,
        },
        isFromData: false,
      );

      final singleGroup = GlobalResponse2.fromJson(response);

      return Right(singleGroup);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, UploadImageModel>> uploadAvatar(File file) async {
    try {
      final avatar = await MultipartFile.fromFile(
        file.path,
        filename: '${file.path.split('/').last}',
      );

      final response = await api.post(EndPoint.uploadImage,
          data: {'avatar': avatar}, isFromData: true);

      final request = UploadImageModel.fromJson(response);

      return Right(request);
    } catch (e) {
      return Left("Failed to upload image.");
    }
  }

  Future<Either<String, UpdateUserModel>> updateUserData(
      {required String name,
      required String email,
      required String phone,
      required String bio}) async {
    try {
      //    "name":"cofa 11",
      // "email":"cofawe22@gmail.com",
      // "phone":"",
      // "bio":"cofa"

      final response = await api.put(
        EndPoint.UpdateUserData,
        data: {
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.phone: phone,
          ApiKey.bio: bio,
        },
      );

      final request = UpdateUserModel.fromJson(response);

      return Right(request);
    } catch (e) {
      return Left("Failed to upload image.");
    }
  }
}
