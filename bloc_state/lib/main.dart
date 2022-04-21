import 'package:bloc_state/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final CounterState counterStateA = CounterState(countvalue: 1);
  final CounterState counterStateB = CounterState(countvalue: 1);
  print(counterStateB == counterStateA);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: BlocListener<CounterCubit, CounterState>(
          listener: (context, state) {
          if(state.wasincremented == true){
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Incremented'),
                duration: Duration(seconds: 2),
                )
            );
          }
          else if(state.wasincremented == false){
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Decremented'),
                duration: Duration(seconds: 2),
                )
            );
          }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    if (state.countvalue < 0) {
                      return Text(
                        'Negative:' + state.countvalue.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      );
                    } else if (state.countvalue > 0) {
                      return Text(
                        'Positive:' + state.countvalue.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      );
                    }

                    return Text(
                      state.countvalue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                        // or we can call
                        // context.bloc<CounterCubit>().decrement();
                      },
                      tooltip: 'Decrement',
                      child: Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      tooltip: 'Increment',
                      child: Icon(Icons.add),
                    )
                  ],
                )
              ],
            ),
          ),
        )

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
