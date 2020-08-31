part of login_view;

class _LoginMobile extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final LoginViewModel viewModel;

  _LoginMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
      viewModel: LoginViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                verticalSpaceMedium,
                // SizedBox(
                //   height: 150,
                //   child: Image.asset('assets/images/title.png'),
                // ),
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
                        model.login(
                          email: emailController.text,
                          password: passwordController.text,
                        )
                      },
                      color: Colors.blue,
                      textColor: Colors.black,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    // BusyButtonWidget(
                    //   title: 'Login',
                    //   onPressed: () {
                    //     model.login(
                    //       email: emailController.text,
                    //       password: passwordController.text,
                    //     );
                    //   },
                    // )
                  ],
                ),
                verticalSpaceMedium,
                TextLink(
                  'Create an Account if you\'re new.',
                  onPressed: () {
                    model.gotoSignUpView();
                  },
                )
              ],
            ),
          )),
    );
  }
}
