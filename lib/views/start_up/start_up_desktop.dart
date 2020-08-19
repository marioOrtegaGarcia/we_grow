part of start_up_view;

class _StartUpDesktop extends StatelessWidget {
  final StartUpViewModel viewModel;

  _StartUpDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('StartUpDesktop')),
    );
  }
}