part of start_up_view;

class _StartUpMobile extends StatelessWidget {
  final StartUpViewModel viewModel;

  _StartUpMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        SizedBox(
          width: 300,
          height: 100,
          child: Image.asset('assets/images/icon_large.png'),
        ),
        Text(
          "WeGrow",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation(Color.fromARGB(1, 179, 9, 0)))
      ])),
    );
  }
}
