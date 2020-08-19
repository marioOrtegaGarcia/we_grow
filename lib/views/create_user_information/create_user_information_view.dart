library create_user_information_view;

import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'create_user_information_view_model.dart';

part 'create_user_information_mobile.dart';
part 'create_user_information_tablet.dart';
part 'create_user_information_desktop.dart';

class CreateUserInformationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CreateUserInformationViewModel viewModel = CreateUserInformationViewModel();
    return ViewModelProvider<CreateUserInformationViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _CreateUserInformationMobile(viewModel),
          desktop: _CreateUserInformationDesktop(viewModel),
          tablet: _CreateUserInformationTablet(viewModel),  
        );
      }
    );
  }
}