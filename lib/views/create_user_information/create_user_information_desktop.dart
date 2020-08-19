part of create_user_information_view;

class _CreateUserInformationDesktop extends StatelessWidget {
  final CreateUserInformationViewModel viewModel;

  _CreateUserInformationDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CreateUserInformationDesktop')),
    );
  }
}