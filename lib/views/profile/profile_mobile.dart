part of profile_view;

class _ProfileMobile extends StatelessWidget {
  final ProfileViewModel viewModel;

  _ProfileMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: Row(
          children: [
            Container(
              width: screenWidth(context),
              padding: EdgeInsets.only(top: 30, bottom: 5),
              child: SizedBox(
                height: 30,
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      "Profile",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    BusyButtonWidget(
                      title: 'Log Out',
                      onPressed: () {
                        viewModel.logout();
                      },
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(2.0, 0),
                      blurRadius: 10.0)
                ],
              ),
            ),
          ],
        ),
        preferredSize: Size(screenWidth(context), 50),
      ),
      body: Column(
        children: <Widget>[
          Text(viewModel.getUserFullName()),
          Spacer(flex: 1),
          BottomBarWidget(index: 2),
        ],
      ),
    );
  }
}
