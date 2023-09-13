import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/model/todo.dart';
const todoListKey = "todo_list";
class TodoRepository  {

    TodoRepository() {
      SharedPreferences.getInstance().then((value) {
        _sharedPreferences = value;
      print(_sharedPreferences?.get("todo_list"));});
}
     SharedPreferences? _sharedPreferences;
  Future<List<Todo>> getTodo() async {
      _sharedPreferences = await  SharedPreferences.getInstance();
      final String jsonString = _sharedPreferences?.getString(todoListKey) ?? '[]';
      final List jsonDecode = json.decode(jsonString) as List;
      return jsonDecode.map((e) => Todo.fromJson(e)).toList();
  }
  void saveTodoList(List<Todo> todos ){
      final jsonTodo = jsonEncode(todos);
      _sharedPreferences?.setString("todo_list", jsonTodo);
  }
}