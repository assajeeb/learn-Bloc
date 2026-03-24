import 'package:equatable/equatable.dart';

 class CounterState extends Equatable {
  final int count;
  const CounterState({this.count = 20});

  CounterState copyWith({int? counter}){
   return CounterState(
    count: counter ?? this.count
   );
  }
  @override
  List<Object> get props => [count];
}


