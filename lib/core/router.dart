// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:test_case/core/router_constants.dart';

import 'package:test_case/views/login/login_view.dart' as view0;
import 'package:test_case/views/choose_country_code/choose_country_code_view.dart' as view1;
import 'package:test_case/views/confirm_phone_number/confirm_phone_number_view.dart' as view2;
import 'package:test_case/views/main/main_view.dart' as view3;
import 'package:test_case/views/search/search_view.dart' as view4;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginViewRoute:
        return MaterialPageRoute(builder: (_) => view0.LoginView());
      case chooseCountryCodeViewRoute:
        return MaterialPageRoute(builder: (_) => view1.ChooseCountryCodeView());
      case confirmPhoneNumberViewRoute:
        return MaterialPageRoute(builder: (_) => view2.ConfirmPhoneNumberView());
      case mainViewRoute:
        return MaterialPageRoute(builder: (_) => view3.MainView());
      case searchViewRoute:
        return MaterialPageRoute(builder: (_) => view4.SearchView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}