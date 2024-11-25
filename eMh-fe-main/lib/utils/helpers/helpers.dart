
class Helpers {
  static void delayRedirection({
    required Duration duration,
    required Function() action,
  }) {
    Future.delayed(duration, action);
  }
}
