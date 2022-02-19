import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:test_case/core/logger.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:test_case/models/country_codes_model.dart';

class ChooseCountryCodeViewModel extends BaseViewModel {
  Logger log;

  ChooseCountryCodeViewModel() {
    log = getLogger(runtimeType.toString());
  }

  List<CountryCodesModel> countries = [];
  bool loadingCountries = false;
  loadCountries() async {
    loadingCountries = true;
    notifyListeners();
    var jsonText = await rootBundle.loadString('lib/data/countries.json');
    countries = (jsonDecode(jsonText) as List)
        .map((e) => CountryCodesModel.fromJson(e))
        .toList();
    loadingCountries = false;
    notifyListeners();
  }
}
