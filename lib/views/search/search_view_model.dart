import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:test_case/core/logger.dart';

class SearchViewModel extends BaseViewModel {
  Logger log;

  SearchViewModel() {
    log = getLogger(runtimeType.toString());
  }
}
