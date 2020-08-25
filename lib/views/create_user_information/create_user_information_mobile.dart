part of create_user_information_view;

class _CreateUserInformationMobile extends StatelessWidget {
  final firstNameController;
  final lastNameController;
  final prefferedDriveDistanceController;

  final CreateUserInformationViewModel viewModel;

  _CreateUserInformationMobile(
    this.viewModel,
    this.firstNameController,
    this.lastNameController,
    this.prefferedDriveDistanceController,
  );

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CreateUserInformationViewModel>.withConsumer(
      viewModel: CreateUserInformationViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 50.0,
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                verticalSpaceLarge,
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 38,
                  ),
                ),
                verticalSpaceLarge,
                InputFieldWidget(
                  placeholder: 'First Name',
                  controller: firstNameController,
                ),
                verticalSpaceSmall,
                InputFieldWidget(
                  placeholder: 'Last Name',
                  controller: lastNameController,
                ),
                verticalSpaceMedium,
                InputFieldWidget(
                  placeholder: 'Preffered Drive Distance',
                  controller: prefferedDriveDistanceController,
                  textInputType: TextInputType.number,
                ),
                verticalSpaceSmall,
                ExpansionListWidget<String>(
                  items: ['Admin', 'Farmer', 'Worker'],
                  title: model.selectedRole,
                  onItemSelected: model.setSelectedRole,
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BusyButtonWidget(
                      title: 'Sign Up',
                      onPressed: () {
                        model.updateUserInfo(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            prefferedDriveDistance:
                                prefferedDriveDistanceController.text);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
