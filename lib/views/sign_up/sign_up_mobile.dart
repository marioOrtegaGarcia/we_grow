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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 38,
                  ),
                ),
                verticalSpaceLarge,
                verticalSpaceLarge,
                InputFieldWidget(
                  placeholder: 'Email',
                  controller: emailController,
                ),
                verticalSpaceSmall,
                InputFieldWidget(
                  placeholder: 'Password',
                  password: true,
                  controller: passwordController,
                  additionalNote:
                      'Password has to be a minimum of 6 characters.',
                ),
                InputFieldWidget(
                  placeholder: ' Verify Password',
                  password: true,
                  controller: verifyPasswordController,
                  additionalNote:
                      'Password has to be a minimum of 6 characters.',
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BusyButtonWidget(
                      title: 'Sign Up',
                      onPressed: () {
                        model.signUp(
                          email: emailController.text,
                          password: passwordController.text,
                          verifyPassword: verifyPasswordController.text,
                          // full_name: fullNameController.text,
                        );
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
