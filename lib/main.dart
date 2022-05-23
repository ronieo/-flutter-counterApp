import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_cubit/blocs/counter/counter_bloc.dart';
import 'package:my_counter_cubit/cubits/counter/counter_cubit.dart';
//import 'package:my_counter_cubit/other_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Counter Bloc을 필요로하는 위젯의 상위 위젯에 BlocProvider Injection해야함
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: MaterialApp(
          title: 'MyCounter Bloc',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Center(
          child: Text(
            // context.watch<T> = ObjectType<T>의 변화를 listen 하는 것
            '${context.watch<CounterBloc>().state.counter}',
            style: TextStyle(fontSize: 52.0),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(IncrementCounterEvent());
            },
            child: Icon(Icons.add),
            heroTag: 'increment',
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
            child: Icon(Icons.remove),
            heroTag: 'decrement',
          )
        ],
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //... BlocConsumer = listener + builder bitten
//       body: BlocConsumer<CounterCubit, CounterState>(
//         listener: (context, state) {
//           if (state.counter == 3) {
//             showDialog(
//               context: context,
//               builder: (context) {
//                 return AlertDialog(
//                   content: Text('counter is ${state.counter}'),
//                 );
//               },
//             );
//           } else if (state.counter == -1) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) {
//                 return OtherPage();
//               }),
//             );
//           }
//         },
//         builder: (context, state) {
//           return Center(
//             child: Text(
//               '${state.counter}',
//               style: TextStyle(fontSize: 52.0),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               context.read<CounterCubit>().increment();
//             },
//             child: Icon(Icons.add),
//             heroTag: 'increment',
//           ),
//           SizedBox(width: 10.0),
//           FloatingActionButton(
//             onPressed: () {
//               context.read<CounterCubit>().decrement();
//             },
//             child: Icon(Icons.remove),
//             heroTag: 'decrement',
//           ),
//         ],
//       ),
//     );
//   }
// }
