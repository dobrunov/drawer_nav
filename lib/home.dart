import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_notifier.dart';
import 'pages.dart';
import 'nav_cubit/nav_cubit.dart';
import 'nav_cubit/nav_event.dart';

class HomeScreen extends StatelessWidget {
  final EventNotifier<NavigationEvent> eventNotifier;

  const HomeScreen({super.key, required this.eventNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Navigation'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                eventNotifier.notify(NavigationEvent.home);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.pageview),
              title: const Text('Page 1'),
              onTap: () {
                eventNotifier.notify(NavigationEvent.page1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.pages),
              title: const Text('Page 2'),
              onTap: () {
                eventNotifier.notify(NavigationEvent.page2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: BlocBuilder<NavigationCubit, NavigationEvent>(
        builder: (context, state) {
          switch (state) {
            case NavigationEvent.home:
              return const HomePage();
            case NavigationEvent.page1:
              return const Page1();
            case NavigationEvent.page2:
              return const Page2();
            default:
              return const HomePage();
          }
        },
      ),
    );
  }
}
