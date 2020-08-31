part of sign_up_view;

class _SignUpMobile extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final verifyPasswordController = TextEditingController();
  final SignUpViewModel viewModel;

  _SignUpMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignUpViewModel>.withConsumer(
      viewModel: SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 50.0,
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                verticalSpaceLarge,
                Text(
                  "WeGrow",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    fontFamily: "Proxima Nova",
                    fontSize: 60,
                  ),
                ),
                verticalSpaceSmall,
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                verticalSpaceMedium,
                InputFieldWidget(
                  placeholder: 'Email',
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                ),
                verticalSpaceSmall,
                InputFieldWidget(
                  placeholder: 'Password',
                  password: true,
                  controller: passwordController,
                  textInputType: TextInputType.visiblePassword,
                  additionalNote:
                      'Password has to be a minimum of 6 characters.',
                ),
                InputFieldWidget(
                  placeholder: ' Verify Password',
                  password: true,
                  controller: verifyPasswordController,
                  textInputType: TextInputType.visiblePassword,
                  additionalNote: 'Verify your password.',
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        // side: BorderSide(
                        //   color: Colors.grey[300],
                        //   width: 2,
                        // ),
                      ),
                      onPressed: () => {
                        model.signUp(
                          email: emailController.text,
                          password: passwordController.text,
                          verifyPassword: verifyPasswordController.text,
                        )
                      },
                      color: Colors.blue,
                      textColor: Colors.black,
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    // BusyButtonWidget(
                    //   title: 'Sign Up',
                    //   onPressed: () {
                    //     model.signUp(
                    //       email: emailController.text,
                    //       password: passwordController.text,
                    //       verifyPassword: verifyPasswordController.text,
                    //       // full_name: fullNameController.text,
                    //     );
                    //   },
                    // )
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
