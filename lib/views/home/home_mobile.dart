part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: !viewModel.busy ? Icon(Icons.add) : CircularProgressIndicator(),
        onPressed: viewModel.navigateToCreateJobPostView,
      ),
      appBar: PreferredSize(
        child: Row(
          children: [
            Container(
              width: screenWidth(context),
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: SizedBox(
                height: 30,
                child: Image.asset('assets/images/title.png'),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => viewModel.fetchJobPosts(),
                child: viewModel.jobPosts != null
                    ? ListView.builder(
                        itemCount: viewModel.jobPosts.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => viewModel.updateJobPost(index),
                          child: JobPostItemWidget(
                            post: viewModel.jobPosts[index],
                            onDeleteItem: () => viewModel.deletePost(index),
                          ),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                            Theme.of(context).primaryColor),
                      )),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarWidget(),
    );
    //   return Scaffold(
    //     backgroundColor: Colors.white,
    //     body: Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 20.0),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.max,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           verticalSpace(30),
    //           Row(
    //             children: <Widget>[
    //               Spacer(),
    //               BusyButtonWidget(
    //                 title: 'Search',
    //                 onPressed: () {
    //                   viewModel.navigateToSearchView();
    //                   print("Going to beta view");
    //                 },
    //               ),
    //               Spacer(),
    //               BusyButtonWidget(
    //                 title: 'Log Out',
    //                 onPressed: () {
    //                   viewModel.logout();
    //                 },
    //               ),
    //             ],
    //           ),
    //           BottomBarWidget(),
    //         ],
    //       ),
    //     ),
    //   );
  }
}
