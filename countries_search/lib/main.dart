import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/countriesprovider.dart';
import './screens/homescreen.dart';
import './screens/searchscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountriesProvider()),
      ],
      child: MaterialApp(
        title: 'Countries Explorer',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
        routes: {
          '/search': (ctx) => const SearchScreen(),
        },
      ),
    );
  }
}
