import 'package:flutter/material.dart';
import 'package:flutter_base_project/helper/flavors/app_config.dart';
import 'package:flutter_base_project/presentation/screens/homeScreen/counter_cubit.dart';
import 'package:flutter_base_project/presentation/widgets/widget_text_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().func(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
      body: BlocConsumer<CounterCubit, int>(
        listenWhen: (context, count) {
          return count == 3;
        },
        listener: (context, count) {
          print("called ");
        },
        builder: (context, counkt) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextView(
                  text: "PAGE ONE",
                  textStyle: Theme.of(context).textTheme.headline4),
              TextView(
                  text: AppConfig.of(context)?.baseUrl ?? "",
                  textStyle: Theme.of(context).textTheme.headline4),
              TextView(
                  text: counkt.toString(),
                  textStyle: Theme.of(context).textTheme.headline1),
            ],
          ),
        ),
      ),
    );
  }
}
