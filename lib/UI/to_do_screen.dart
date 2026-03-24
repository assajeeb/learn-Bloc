import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnblocnew/todo_bloc/todo_bloc.dart';
import 'package:learnblocnew/todo_bloc/todo_event.dart';
import 'package:learnblocnew/todo_bloc/todo_state.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To Do "),),
      body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {

        return ListView.builder(
          itemCount: state.todoList.length, itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Text((index + 1).toString()),
              title: Text(state.todoList[index]),
              trailing: IconButton(onPressed: () {
                context.read<TodoBloc>().add(RemoveTodo(index: index));
              }, icon: Icon(Icons.delete, color: Colors.red,)),
            ),
          );
        },);
      },),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<TodoBloc>().add(
            AddToDo(data: (context.read<TodoBloc>().state.todoList.length + 1).toString()));
      }),
    );
  }
}
