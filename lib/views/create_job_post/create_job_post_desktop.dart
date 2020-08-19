part of create_job_post_view;

class _CreateJobPostDesktop extends StatelessWidget {
  final CreateJobPostViewModel viewModel;

  _CreateJobPostDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CreateJobPostDesktop')),
    );
  }
}