import 'dart:ffi';

import 'package:equatable/equatable.dart';

class SwitchState extends Equatable{
  final notificationBool ;
  final double slider;

  const SwitchState({ this.notificationBool = false, this.slider = 1.0});

  SwitchState copyWith ({bool? notfication_bool, double? slider}){
    return SwitchState(notificationBool: notfication_bool ?? this.notificationBool,slider: slider ?? this.slider);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [notificationBool,slider];

}