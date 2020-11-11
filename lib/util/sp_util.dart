import 'package:shared_preferences/shared_preferences.dart';

Future<String> getString(String key) async {
  var sp = await SharedPreferences.getInstance();
  var value = sp.getString(key) ?? "";
  return value;
}

Future<void> saveValue(String key, dynamic value) async {
  var sp = await SharedPreferences.getInstance();
  if (value is String) {
    sp.setString(key, value);
  } else if (value is int) {
    sp.setInt(key, value);
  } else if (value is bool) {
    sp.setBool(key, value);
  } else if (value is double) {
    sp.setDouble(key, value);
  } else if (value is List<String>) {
    sp.setStringList(key, value);
  } else {
    throw Exception("不支持的类型");
  }
}
