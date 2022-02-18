import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:test_case/core/logger.dart';

class ConfirmPhoneNumberViewModel extends BaseViewModel {
  Logger log;

  ConfirmPhoneNumberViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
