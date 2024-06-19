import 'package:flutter_bloc/flutter_bloc.dart';

import '../event_notifier.dart';
import 'nav_event.dart';

class NavigationCubit extends Cubit<NavigationEvent> {
  final EventNotifier<NavigationEvent> eventNotifier;
  late final void Function(NavigationEvent) _listener;

  NavigationCubit(this.eventNotifier) : super(NavigationEvent.home) {
    _listener = (event) => emit(event);
    eventNotifier.addListener(_listener);
  }

  @override
  Future<void> close() {
    eventNotifier.removeListener(_listener);
    return super.close();
  }
}
