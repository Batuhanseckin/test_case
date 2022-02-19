import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_case/core/logger.dart';
import 'package:test_case/core/router_constants.dart';

class ConfirmPhoneNumberViewModel extends BaseViewModel {
  Logger log;

  ConfirmPhoneNumberViewModel() {
    log = getLogger(runtimeType.toString());
  }

  nextMain() {
    NavigationService().pushNamedAndRemoveUntil(mainViewRoute);
  }
}
