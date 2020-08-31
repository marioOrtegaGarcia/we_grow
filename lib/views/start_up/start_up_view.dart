library start_up_view;

import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'start_up_view_model.dart';

part 'start_up_mobile.dart';
part 'start_up_tablet.dart';
part 'start_up_desktop.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StartUpViewModel viewModel = StartUpViewModel();
    return ViewModelProvider<StartUpViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          viewModel.handleStartupLogic();
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _StartUpMobile(viewModel),
            desktop: _StartUpDesktop(viewModel),
            tablet: _StartUpTablet(viewModel),
          );
        });
  }
}
