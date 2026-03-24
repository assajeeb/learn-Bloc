import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable{
  const TodoEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AddToDo extends TodoEvent{
  final String? data;

  const AddToDo({this.data});

  @override
  List<Object?> get props => [data];
}

class RemoveTodo extends TodoEvent{
  final int? index;

  const RemoveTodo({required this.index});

  @override

  List<Object?> get props => [index];
}