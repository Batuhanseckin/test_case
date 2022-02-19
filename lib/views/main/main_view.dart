import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'main_view_model.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (BuildContext context, MainViewModel viewModel, Widget _) {
        return Scaffold(
          body: _buildBody(),
        );
      },
      viewModelBuilder: () => MainViewModel(),
    );
  }

  Center _buildBody() {
    return Center(
      child: Text('Main View'),
    );
  }
}
