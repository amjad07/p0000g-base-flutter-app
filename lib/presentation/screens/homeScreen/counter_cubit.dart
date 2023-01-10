import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(3);


  func(){
    print("this is a function");
  }


  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}