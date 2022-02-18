import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'choose_country_code_view_model.dart';
          
class ChooseCountryCodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChooseCountryCodeViewModel>.reactive(
      builder: (BuildContext context, ChooseCountryCodeViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text('ChooseCountryCode View'),
          ),
        );
      },
      viewModelBuilder: () => ChooseCountryCodeViewModel(),
    );
  }
}
