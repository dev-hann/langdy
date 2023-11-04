import 'package:flutter/material.dart';
import 'package:langdy/provider/town_detail_provider.dart';
import 'package:langdy/provider/town_provider.dart';
import 'package:langdy/provider/home_provider.dart';
import 'package:langdy/util/date_time_format.dart';
import 'package:langdy/view/main_view.dart';
import 'package:provider/provider.dart';

void main() {
  DateTimeFormat.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Langdy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => HomeProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => TownProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => TownDetailProvider(),
          ),
        ],
        child: const MainView(),
      ),
    );
  }
}
