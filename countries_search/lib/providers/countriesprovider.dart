import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/countrymodel.dart';

class CountriesProvider with ChangeNotifier {
  List<Country> _countries = [];
  bool _isLoading = false;

  List<Country> get countries => _countries;
  bool get isLoading => _isLoading;

  Future<void> fetchCountries() async {
    if (_countries.isNotEmpty) return; // Avoid unnecessary re-fetching

    _isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse('https://restcountries.com/v3.1/all');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _countries = data.map((item) => Country.fromJson(item)).toList();
      } else {
        throw Exception('Failed to fetch countries');
      }
    } catch (error) {
      throw Exception('An error occurred: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
