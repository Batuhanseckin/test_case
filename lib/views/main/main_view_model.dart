import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:test_case/core/logger.dart';

class MainViewModel extends IndexTrackingViewModel {
  Logger log;

  MainViewModel() {
    log = getLogger(runtimeType.toString());
  }
}
