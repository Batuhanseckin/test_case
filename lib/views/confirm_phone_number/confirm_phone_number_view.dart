import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'confirm_phone_number_view_model.dart';
          
class ConfirmPhoneNumberView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ConfirmPhoneNumberViewModel>.reactive(
      builder: (BuildContext context, ConfirmPhoneNumberViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text('ConfirmPhoneNumber View'),
          ),
        );
      },
      viewModelBuilder: () => ConfirmPhoneNumberViewModel(),
    );
  }
}
