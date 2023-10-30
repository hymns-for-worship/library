class Signal<T> {
  Signal(this._value);

  T _value;
  T get value => _value;
  set value(T value) {
    _value = value;
    notifyListeners();
  }

  void notifyListeners() {
    for (final listener in listeners) {
      listener();
    }
  }

  void dispose() {
    listeners.clear();
  }

  List<void Function()> listeners = [];

  void addListener(void Function() listener) {
    listeners.add(listener);
    listener();
  }

  void removeListener(void Function() listener) {
    listeners.remove(listener);
  }
}
