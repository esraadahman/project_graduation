import 'package:hive/hive.dart';

//abstract 
class HiveConstants{

  static const String Boxname="user";
  static const String boxName = "workspaceBox";
 Future<void> saveData(String key, dynamic value) async {
    final box = Hive.box(boxName);
    await box.put(key, value);
  }

  // Retrieve data from Hive
  dynamic getData(String key) {
    final box = Hive.box(boxName);
    return box.get(key);
  }

  // Delete data from Hive
  Future<void> deleteData(String key) async {
    final box = Hive.box(boxName);
    await box.delete(key);
  }

  // Clear all data in the box
  Future<void> clearBox() async {
    final box = Hive.box(boxName);
    await box.clear();
  }
}