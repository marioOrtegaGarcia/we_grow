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
              vertical: 25.0,
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'One More step',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                verticalSpaceSmall,
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: new SizedBox(
                      width: 180,
                      height: 180,
                      child: (model.image != null)
                          ? GestureDetector(
                              child: Image.file(
                                model.image,
                                fit: BoxFit.fill,
                              ),
                              onTap: () {
                                model.removeImage();
                              })
                          : FlatButton.icon(
                              color: Colors.blue,
                              shape: CircleBorder(),
                              icon: Icon(Icons.add_a_photo, size: 60),
                              splashColor: Colors.green,
                              label: Text(""),
                              padding: EdgeInsets.all(35),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Upload Image"),
                                      content:
                                          Text("Select where to upload from"),
                                      actions: [
                                        FlatButton(
                                          child: Text("Camera"),
                                          onPressed: () {
                                            model.getImageFromUser(
                                                ImageSource.camera);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          child: Text("Gallery"),
                                          onPressed: () {
                                            model.getImageFromUser(
                                                ImageSource.gallery);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          child: Text("Cancel"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                      elevation: 24,
                                    );
                                  },
                                );
                              },
                            ),
                    ),
                  ),
                ),
                verticalSpaceSmall,
                InputFieldWidget(
                  placeholder: 'First Name',
                  controller: firstNameController,
                ),
                verticalSpaceSmall,
                InputFieldWidget(
                  placeholder: 'Last Name',
                  controller: lastNameController,
                ),
                verticalSpaceSmall,
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
