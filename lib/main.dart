import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_notifier.dart';
import 'home.dart';
import 'nav_cubit/nav_cubit.dart';
import 'nav_cubit/nav_event.dart';

void main() {
  final eventNotifier = EventNotifier<NavigationEvent>();
  final navigationCubit = NavigationCubit(eventNotifier);

  runApp(MyApp(navigationCubit: navigationCubit, eventNotifier: eventNotifier));
}

class MyApp extends StatelessWidget {
  final NavigationCubit navigationCubit;
  final EventNotifier<NavigationEvent> eventNotifier;

  const MyApp({super.key, required this.navigationCubit, required this.eventNotifier});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>.value(value: navigationCubit),
      ],
      child: MaterialApp(
        home: HomeScreen(eventNotifier: eventNotifier),
      ),
    );
  }
}
