import 'package:bloc/bloc.dart';
import 'package:gradution_project/Core/api/endPointes.dart';
import 'package:gradution_project/Core/hive_constants/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'settingscubit_state.dart';

class SettingscubitCubit extends Cubit<SettingscubitState> {
  SettingscubitCubit() : super(SettingscubitInitial());

  static final Box box = Hive.box(HiveConstants.Boxname);
  String get name => box.get(ApiKey.name, defaultValue: "User") as String;
  String get email =>  box.get(ApiKey.email, defaultValue: "email") as String;
  String get pass =>  box.get(ApiKey.password, defaultValue: "password") as String;

}
