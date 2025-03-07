import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {


  static Future<SharedPreferences> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static Future<void> setBool({required String key,required bool value}) async {
    await saveData().then((prefs) {
      prefs.setBool(key, value);
    });
  }

  static Future<bool?> getBool({required String key}) async {
    bool? getBool;
    await saveData().then((prefs) {
      getBool = prefs.getBool(key);
    });
    return getBool;
  }

  static Future<void> setString({required String key,required String value}) async {
    await saveData().then((prefs) {
      prefs.setString(key, value);
    });
  }

  static Future<String?> getString({required String key}) async {
    String? text;
    await saveData().then((prefs) {
      text = prefs.getString(key);
    });
    return text;
  }
  
  static Future<void> removeKey({required String key}) async {
    await saveData().then((prefs) {
      prefs.remove(key);
    });
  }


}