import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:test_case/core/logger.dart';

class ChooseCountryCodeViewModel extends BaseViewModel {
  Logger log;

  ChooseCountryCodeViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
