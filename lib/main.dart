import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_meal/controllers/search_provider.dart';
import 'package:school_meal/dependency_injection.dart';
import 'package:school_meal/routes/pages.dart';
import 'package:school_meal/values/constants/api_keys.dart';

void main() {
  setup();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => instance<SchoolSearchProvider>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Pages.initialPage,
      routes: Pages.routes,
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
