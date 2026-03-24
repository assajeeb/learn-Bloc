import 'package:bloc/bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';




class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
  }

  void _increment(CounterEvent event,Emitter emit){
    print("Increment  bloc");
    emit(state.copyWith(counter: state.count+1));
  }
  void _decrement(CounterEvent event, Emitter emit){
    emit(state.copyWith(counter: state.count-1));
  }
}
