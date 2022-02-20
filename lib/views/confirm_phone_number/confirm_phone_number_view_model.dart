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

  String formatTime(int seconds) {
    var minute = (seconds / 60).floor();
    var remainSeconds = (seconds % 60);
    return '${minute.toString().length < 2 ? ("0" + minute.toString()) : minute}:${remainSeconds.toString().length < 2 ? ("0" + remainSeconds.toString()) : remainSeconds}';
  }
}
