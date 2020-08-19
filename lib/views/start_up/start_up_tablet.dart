part of start_up_view;

class _StartUpTablet extends StatelessWidget {
  final StartUpViewModel viewModel;

  _StartUpTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('StartUpTablet')),
    );
  }
}