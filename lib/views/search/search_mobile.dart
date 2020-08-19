part of search_view;

class _SearchMobile extends StatelessWidget {
  final SearchViewModel viewModel;

  _SearchMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Row(
          children: [
            Container(
              width: screenWidth(context),
              padding: EdgeInsets.only(top: 30, bottom: 5),
              child: SizedBox(
                height: 30,
                child: Text(
                  "Search",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
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
          Spacer(),
          BottomBarWidget(index: 1),
        ],
      ),
    );
  }
}
