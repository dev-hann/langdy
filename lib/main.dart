import 'package:flutter/material.dart';
import 'package:langdy/provider/town_detail_provider.dart';
import 'package:langdy/provider/town_provider.dart';
import 'package:langdy/provider/home_provider.dart';
import 'package:langdy/repo/town_repo.dart';
import 'package:langdy/use_case/town_use_case.dart';
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
    final townUseCase = TownUseCase(TownImpl());
    return MaterialApp(
      title: 'Langdy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          foregroundColor: Colors.black,
        ),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => HomeProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => TownProvider(townUseCase),
          ),
          ChangeNotifierProvider(
            create: (_) => TownDetailProvider(townUseCase),
          ),
        ],
        child: const MainView(),
      ),
    );
  }
}
