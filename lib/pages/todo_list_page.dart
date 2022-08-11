import 'package:flutter/material.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/widgets/todo_list_item.dart';

class todo_list_page extends StatefulWidget {
    todo_list_page({Key? key}) : super(key: key);

  @override
  State<todo_list_page> createState() => _todo_list_pageState();
}

class _todo_list_pageState extends State<todo_list_page> {
   final TextEditingController  todoController = TextEditingController();

  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding:  const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children:  [
                    Expanded(
                      child: TextField(

                          decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Adicionar Tarefa",
                          hintText: "Ex.  Estudar Matematica"

                        ),
                        controller: todoController,

                      ),
                    ),
                    const SizedBox(width: 8,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                        onSurface: Colors.green,
                        elevation: 20,
                        shadowColor: Colors.black12,
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 30,

                      ),
                      onPressed: () {
                        String title = todoController.text;
                        setState(() {
                          Todo newTodo = Todo(
                              title: title,
                              dateTime: DateTime.now()
                          );

                          todos.add(newTodo);
                        },
                        );
                        todoController.clear();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16,),
                Flexible(

                  child: ListView(
                    shrinkWrap: true,

                    children: [
                      for( Todo todo in todos )
                        TodoListItem(
                          todo: todo,
                        ),
                    ],

                  ),
                ),
                const SizedBox(height: 16,),
                Row(
                  children: [
                     Expanded(
                     child: Text('Você Possui ${todos.length} Tarefas Pendentes',
                       style: const TextStyle(
                         fontWeight: FontWeight.w500,
                         fontSize: 14,
                       ),

                     ),
                   ),
                    const SizedBox(width: 8,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                        onSurface: Colors.green,
                        elevation: 20,
                        shadowColor: Colors.black12,
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Text('Limpar Tudo'

                      ),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}
