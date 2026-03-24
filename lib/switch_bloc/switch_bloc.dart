import 'package:bloc/bloc.dart';
import 'package:learnblocnew/switch_bloc/switch_event.dart';
import 'package:learnblocnew/switch_bloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{
  SwitchBloc():super(const SwitchState()){
    on<EnableNotificationBool>(_enableNotification);
    on<ChangeSlider>(_changeSlider);
  }

  _enableNotification(SwitchEvent event, Emitter emit){
    emit(state.copyWith(notfication_bool: !state.notificationBool));
  }
  _changeSlider(ChangeSlider event, Emitter<SwitchState> emit){
    emit(state.copyWith(slider: event.slider));
  }
}