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
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onPressed: () => {viewModel.logout()},
                      color: Colors.blue,
                      textColor: Colors.black,
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
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
          Row(
            children: <Widget>[
              Column(
                children: [
                  // CachedNetworkImage(
                  //   imageUrl: viewModel.getProfileImageUrl(),
                  //   progressIndicatorBuilder:
                  //       (context, url, downloadProgress) =>
                  //           CircularProgressIndicator(
                  //               value: downloadProgress.progress),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  // ),
                  CircleAvatar(
                    backgroundImage: _getUserImage(),
                  ),
                ],
              ),
              horizontalSpaceTiny,
              Text(viewModel.getUserFullName()),
            ],
          ),
          Spacer(flex: 1),
          Text(viewModel.getProfileImageUrl() ?? "No Image found"),
          Spacer(flex: 1),
          BottomBarWidget(index: 2),
        ],
      ),
    );
  }

  dynamic _getUserImage() {
    try {
      return Image.network(
        viewModel.getProfileImageUrl(),
      );
    } catch (err) {
      return Icon(Icons.person_outline);
    }
  }
}
