import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/country.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({Key? key}) : super(key: key);

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {

  Future<List<Country>> getAllCountries() async {
    const url = 'https://countriesnow.space/api/v0.1/countries/flag/images';

    var response = await http.get(Uri.parse(url));
    List<Country> countries = [];

    if(response.statusCode == 200)
    {
      var jsonResponse = json.decode(response.body);
      var jsonCountries = jsonResponse['data'];

      for(var ctry in jsonCountries)
      {
        Country country = Country.fromJson(ctry);
        countries.add(country);
      }
    }
    else
    {}
    return countries;
  } // end of getAllCountries

    @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
