import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:test_case/core/logger.dart';

class LoginViewModel extends BaseViewModel {
  Logger log;

  LoginViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
