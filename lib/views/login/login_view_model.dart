import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_case/core/logger.dart';
import 'package:test_case/core/router_constants.dart';
import 'package:test_case/models/country_codes_model.dart';

class LoginViewModel extends BaseViewModel {
  Logger log;
  CountryCodesModel selectedCountry;

  LoginViewModel() {
    log = getLogger(runtimeType.toString());
  }

  nextConfirmPage() {
    NavigationService().pushNamedAndRemoveUntil(confirmPhoneNumberViewRoute);
  }
}
