library create_job_post_view;

import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:we_grow/core/models/job_post.dart';
import 'package:we_grow/theme/ui_helpers.dart';
import 'package:we_grow/widgets/input_field_widget.dart';
import 'create_job_post_view_model.dart';

part 'create_job_post_mobile.dart';
part 'create_job_post_tablet.dart';
part 'create_job_post_desktop.dart';

class CreateJobPostView extends StatelessWidget {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final payRateController = TextEditingController(text: '0');
  final JobPost edittingPost;

  CreateJobPostView({
    Key key,
    this.edittingPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateJobPostViewModel viewModel = CreateJobPostViewModel();
    return ViewModelProvider<CreateJobPostViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          titleController.text = edittingPost?.title ?? "";
          descriptionController.text = edittingPost?.description ?? "";
          payRateController.text = edittingPost?.payRate.toString() ?? "0";
          viewModel.setEdittingPost(edittingPost);
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _CreateJobPostMobile(
              viewModel,
              titleController,
              descriptionController,
              payRateController,
              edittingPost,
            ),
            desktop: _CreateJobPostDesktop(viewModel),
            tablet: _CreateJobPostTablet(viewModel),
          );
        });
  }
}
