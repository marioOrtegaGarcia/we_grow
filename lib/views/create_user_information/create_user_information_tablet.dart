part of create_user_information_view;

class _CreateUserInformationTablet extends StatelessWidget {
  final CreateUserInformationViewModel viewModel;

  _CreateUserInformationTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CreateUserInformationTablet')),
    );
  }
}