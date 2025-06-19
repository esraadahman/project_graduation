part of 'add_challenge_cubit.dart';

@immutable
sealed class AddChallengeState {}

final class AddChallengeInitial extends AddChallengeState {}

/////************************************ Add challange */

final class TaskCubitAddChallangeLoading extends AddChallengeState {}

final class TaskCubitAddChallangeSuccess extends AddChallengeState {}

final class TaskCubitAddChallangeFail extends AddChallengeState {}

/////************************************ update challange */

final class TaskCubitupdateChallangeLoading extends AddChallengeState {}

final class TaskCubitupdateChallangeSuccess extends AddChallengeState {}

final class TaskCubitupdateChallangeFail extends AddChallengeState {}
