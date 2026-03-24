import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable{

  const SwitchEvent();
  @override

  List<Object?> get props => throw UnimplementedError();
}

class EnableNotificationBool extends SwitchEvent{}

class ChangeSlider extends SwitchEvent{
  final double? slider;
  const ChangeSlider({this.slider});
  @override

  List<Object?> get props => [slider];

}
