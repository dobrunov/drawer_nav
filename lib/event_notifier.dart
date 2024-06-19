class EventNotifier<Event> {
  static final EventNotifier global = EventNotifier();

  final listeners = <void Function(Event event)>{};

  void addListener(void Function(Event event) listener) {
    listeners.add(listener);
  }

  void removeListener(void Function(Event event) listener) {
    listeners.remove(listener);
  }

  void removeAllListeners() {
    listeners.clear();
  }

  void notify(Event event, {bool notifyGlobally = true}) {
    for (var listener in listeners) {
      listener(event);
    }
    if (notifyGlobally && global != this) {
      global.notify(event, notifyGlobally: false);
    }
  }
}
