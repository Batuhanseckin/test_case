import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test_case/views/search/search_view.dart';
import 'package:test_case/widgets/bnv/custom_bottom_navbar.dart';
import 'main_view_model.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (BuildContext context, MainViewModel viewModel, Widget _) {
        return Scaffold(
          body: getBodyFromCurrentIndex(viewModel),
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: viewModel.currentIndex,
            onTap: (index) {
              if (viewModel.currentIndex != index) {
                viewModel.setIndex(index);
              }
            },
          ),
        );
      },
      viewModelBuilder: () => MainViewModel(),
    );
  }

  Widget getBodyFromCurrentIndex(MainViewModel viewModel) {
    switch (viewModel.currentIndex) {
      case 0:
        return SearchView();
        break;
      default:
        return const Center(
          child: Text('page not found'),
        );
    }
  }
}
