import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(countvalue: 0));

  void increment()=>emit(CounterState(countvalue: state.countvalue +1,wasincremented: true));
  void decrement()=>emit(CounterState(countvalue: state.countvalue -1,wasincremented: false));
}
