
import 'package:bloc_state/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

void main(){

  
  group('CounterCubit', (){
    CounterCubit? counterCubit;

    setUp((){
      counterCubit = CounterCubit(); 
    });

    tearDown(() {
      counterCubit!.close();
    });

    test('the initial state for Countercubit is CounterState(conutvalue:0)', () {
      expect(counterCubit!.state, CounterState(countvalue: 0));
    });

    blocTest('the cubit should emit the CounterState(countvalue:1,wasIncremented:true) whne increment function is called',
     build: ()=>CounterCubit(),
     act: (CounterCubit bloc) => bloc.increment(),    
     expect:()=>[CounterState(countvalue: 1,wasincremented: true)],
     
     );
     blocTest('the cubit should emit the CounterState(countvalue:1,wasIncremented:true) whne increment function is called',
     build: ()=>CounterCubit(),
     act: (CounterCubit cubit)=> cubit.decrement(),
     expect:()=>[CounterState(countvalue: -1,wasincremented: false)],
     );

  });
}
