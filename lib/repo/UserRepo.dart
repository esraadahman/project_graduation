import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_graduation/Core/api/api_consumer.dart';
import 'package:project_graduation/Core/api/endPointes.dart';
import 'package:project_graduation/Core/errors/exceptions.dart';
import 'package:project_graduation/Core/hive_constants/hive_constants.dart';
import 'package:project_graduation/ModelView/AddNewWorkSpace/AddNewWorkSpaceModel.dart';
import 'package:project_graduation/ModelView/AllGroups/AllGroups.dart';
import 'package:project_graduation/ModelView/Group/SingleGroupModel.dart';
import 'package:project_graduation/ModelView/Sign_UP/SignUpModel.dart';

class Userrepo {
  final ApiConsumer api;

  Userrepo({required this.api});

  static final Box box = Hive.box(HiveConstants.Boxname);

  Future<Either<String, GroupResponse>> AddWorkSpace({
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

      final user = GroupResponse.fromJson(response);
      print(user.status.toString() +
          "  " +
          user.group.description +
          " " +
          user.group.title +
          "  " +
          user.group.stage +
          "  " +
          user.group.deadline.toString());
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, AllGroups>> getAllGroups() async {
    try {
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
      final response = await api.get(EndPoint.getGroupByID(id));
      final singleGroup = SingleGroupModel.fromJson(response);
      return Right(singleGroup);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  
  Future<Either<String, GlobalResponse>> deleteGroup(int id) async {
    try {
      final response = await api.delete(EndPoint.deleteGroup(id));
      final singleGroup = GlobalResponse.fromJson(response);
      return Right(singleGroup);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
}
