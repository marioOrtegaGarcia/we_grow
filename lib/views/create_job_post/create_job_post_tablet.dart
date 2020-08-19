part of create_job_post_view;

class _CreateJobPostTablet extends StatelessWidget {
  final CreateJobPostViewModel viewModel;

  _CreateJobPostTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CreateJobPostTablet')),
    );
  }
}