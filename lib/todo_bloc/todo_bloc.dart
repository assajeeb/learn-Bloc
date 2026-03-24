import 'package:bloc/bloc.dart';
import 'package:learnblocnew/todo_bloc/todo_event.dart';
import 'package:learnblocnew/todo_bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent,TodoState>{

  TodoBloc():super(const TodoState()){
    on<AddToDo>(_addDataTodo);
    on<RemoveTodo>(_removeDataTodo);
  }
  
  void _addDataTodo(AddToDo event, Emitter<TodoState> emit){
    if(event.data == null) return;
    List<String> updatedList = List.from(state.todoList)..add(event.data!);

    emit(state.copyWith(todoList: updatedList));
  }
  void _removeDataTodo(RemoveTodo event, Emitter<TodoState> emit){
    if(event.index == null) return;
    List<String> updatedList = List.from(state.todoList)..removeAt(event.index!);
    emit(state.copyWith(todoList: updatedList));
  }
}