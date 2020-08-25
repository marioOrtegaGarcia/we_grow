part of create_job_post_view;

class _CreateJobPostMobile extends StatelessWidget {
  final titleController;
  final descriptionController;
  final payRateController;
  final JobPost edittingPost;
  final CreateJobPostViewModel viewModel;

  _CreateJobPostMobile(
    this.viewModel,
    this.titleController,
    this.descriptionController,
    this.payRateController,
    this.edittingPost,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: !viewModel.busy
            ? Icon(Icons.add)
            : CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
        onPressed: () {
          if (!viewModel.busy) {
            viewModel.addPost(
              title: titleController.text,
              description: descriptionController.text,
              payRate: double.parse(payRateController.text),
            );
          }
        },
        backgroundColor:
            !viewModel.busy ? Theme.of(context).primaryColor : Colors.grey[600],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              verticalSpace(40),
              Text(
                'Create a Job',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              verticalSpaceTiny,
              Text("Post Image"),
              verticalSpaceTiny,
              Container(
                height: 250,
                decoration: fieldDecoration,
                alignment: Alignment.center,
                child: Text(
                  "Add Image",
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ),
              verticalSpaceMedium,
              InputFieldWidget(
                placeholder: "Title",
                controller: titleController,
              ),
              verticalSpaceTiny,
              InputFieldWidget(
                placeholder: "Description",
                controller: descriptionController,
              ),
              verticalSpaceSmall,
              InputFieldWidget(
                placeholder: "Pay rate/Hour",
                controller: payRateController,
                textInputType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
