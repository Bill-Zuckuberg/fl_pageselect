import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const _kIcons = [
    Icon(Icons.event),
    Icon(Icons.home),
    Icon(Icons.android),
    Icon(Icons.alarm),
    Icon(Icons.face),
    Icon(Icons.language),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Page Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
          length: _kIcons.length,
          child: Builder(
              builder: (BuildContext context) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        const TabPageSelector(),
                        Expanded(
                            child: IconTheme(
                          data: IconThemeData(
                              size: 128,
                              color: Theme.of(context).colorScheme.secondary),
                          child: const TabBarView(children: _kIcons),
                        )),
                        ElevatedButton(
                            onPressed: () {
                              final TabController controller =
                                  DefaultTabController.of(context)!;
                              if (!controller.indexIsChanging) {
                                controller.animateTo(_kIcons.length - 1);
                              }
                            },
                            child: const Text('Skip'))
                      ],
                    ),
                  ))),
    );
  }
}
