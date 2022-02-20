import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:test_case/core/logger.dart';

class SearchViewModel extends BaseViewModel {
  Logger log;
  bool favorite = false;

  SearchViewModel() {
    log = getLogger(runtimeType.toString());
  }
}
