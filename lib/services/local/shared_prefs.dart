import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:do_an_cuoi_ki/models/food_model.dart';

class SharedPrefs {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final String key = 'key';

  Future<List<TodoModel>?> getList() async {
    SharedPreferences prefs = await _prefs;
    String? data = prefs.getString(key);
    if (data == null) return null;

    print('object $data');

    List<Map<String, dynamic>> maps = jsonDecode(data)
        .cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;

    return maps.map((e) => TodoModel.fromJson(e)).toList();
  }

  Future<void> saveList(List<TodoModel> todos) async {
    SharedPreferences prefs = await _prefs;
    List<Map<String, dynamic>> maps = todos.map((e) => e.toJson()).toList();
    prefs.setString(key, jsonEncode(maps));
  }
}
