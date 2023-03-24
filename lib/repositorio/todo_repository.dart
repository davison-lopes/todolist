import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/model/todo.dart';

class TodoRepository  {
  late SharedPreferences _sharedPreferences;
    TodoRepository() {
      SharedPreferences.getInstance().then((value) => _sharedPreferences = value);


}
  void saveTodoList(List<Todo> todos ){
      final jsonTodo = jsonEncode(todos);
      print(jsonTodo);
  }
}