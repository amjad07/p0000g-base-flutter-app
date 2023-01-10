import 'dart:async';

class HomeBloc {
  final controller = StreamController();

  Stream get getCount => controller.stream;

  void updateCount(int count) {
    controller.sink.add(count);
  }

  void dispose() {
    controller.close();
  }
}
