import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnblocnew/switch_bloc/switch_bloc.dart';
import 'package:learnblocnew/switch_bloc/switch_event.dart';
import 'package:learnblocnew/switch_bloc/switch_state.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learning Switch"),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text("Notifications"),
              BlocBuilder<SwitchBloc, SwitchState>(
                builder: (context, state) {
                  return Switch(
                    value: state.notificationBool, onChanged: (value) {
                    context.read<SwitchBloc>().add(EnableNotificationBool());
                  },);
                },
              )
            ],
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Container(
                width: 300,
                height: 200,
                color: Colors.red.withOpacity(state.slider),
              );
            },
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Slider(value: state.slider, onChanged: (value) {
                context.read<SwitchBloc>().add(ChangeSlider(slider: value));
              },);
            },
          )
        ],
      ),
    );
  }
}
