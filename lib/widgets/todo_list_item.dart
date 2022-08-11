import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/model/todo.dart';


class TodoListItem extends StatelessWidget {
  const TodoListItem({Key? key, required this.todo}) : super(key: key);

  final Todo todo;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[300],
      ),

      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(8) ,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
          DateFormat('dd/MM/yyyy').format(todo.dateTime),
           style: const TextStyle(
             fontSize: 10,
           ),),
           Text(  todo.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,

              ),
            ),
          ],
        ),
      ),


    );
  }

}
