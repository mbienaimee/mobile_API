import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/homescreen.dart';
import './screens/searchscreen.dart';
import './screens/countrydetailscrees.dart';
import './models/countrymodel.dart';
import './providers/countriesprovider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CountriesProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countries Explorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/search': (context) => const SearchScreen(),
        '/details': (context) {
          final country = ModalRoute.of(context)!.settings.arguments as Country;
          return CountryDetailScreen(country: country);
        },
      },
    );
  }
}