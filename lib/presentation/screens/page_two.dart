import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/helper/flavors/app_config.dart';
import 'package:flutter_base_project/presentation/widgets/widget_text_view.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextView(text: "PAGE TWO", textStyle: Theme.of(context).textTheme.headline4),
          TextView(
              text: AppConfig.of(context)?.baseUrl ?? "",
              textStyle: Theme.of(context).textTheme.headline4),

        ],
      ),
    );
  }
}
