import 'package:flutter/material.dart';
import 'package:flutter_base_project/helper/flavors/app_config.dart';
import 'package:flutter_base_project/presentation/screens/homeScreen/counter_cubit.dart';
import 'package:flutter_base_project/presentation/widgets/widget_text_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../navbar/navigation_cubit.dart';
import '../navbar/navigation_state.dart';

class PageFour extends StatefulWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  State<PageFour> createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
      body: BlocConsumer<NavigationCubit, NavigationState>(

        listener: (context, count) {
          print("count ${count.index}");
        },
        builder: (context, counkt) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextView(
                  text: "PAGE four ${counkt.index}",
                  textStyle: Theme.of(context).textTheme.headline4),
              TextView(
                  text: AppConfig.of(context)?.baseUrl ?? "",
                  textStyle: Theme.of(context).textTheme.headline4),

            ],
          ),
        ),
      ),
    );
  }
}
