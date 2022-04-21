part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int countvalue;
  bool? wasincremented;
  CounterState({
    required this.countvalue,
    this.wasincremented,
  });

  @override
  // TODO: implement props

  List<Object?> get props => [this.countvalue,this.wasincremented];
  
}


