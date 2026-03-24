import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnblocnew/bloc/counter_bloc.dart';

import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App Bloc")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(

            builder: (context, state) {
              return Text(
                state.count.toString(),
                style: TextStyle(color: Colors.black, fontSize: 20),
              );
            },
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementEvent());
            },
            child: Text("Increment"),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementEvent());
            },
            child: Text("Decrement"),
          ),
        ],
      ),
    );
  }
}
