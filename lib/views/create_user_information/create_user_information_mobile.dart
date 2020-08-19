part of create_user_information_view;

class _CreateUserInformationMobile extends StatelessWidget {
  final CreateUserInformationViewModel viewModel;

  _CreateUserInformationMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CreateUserInformationMobile')),
    );
  }
}