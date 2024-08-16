
import 'dart:async';
import 'dart:ui';

class Debouncer {
  static Timer? _debounce;

  static void run(VoidCallback action, {int milliseconds = 1000}) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(Duration(milliseconds: milliseconds), action);
  }

  static void cancel() {
    _debounce?.cancel();
  }
}
