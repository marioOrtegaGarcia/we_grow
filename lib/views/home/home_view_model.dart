import 'package:we_grow/core/base/base_view_model.dart';
import 'package:we_grow/core/locator.dart';
import 'package:we_grow/core/models/job_post.dart';
import 'package:we_grow/core/routing/route_names.dart';
import 'package:we_grow/core/services/authentication_service.dart';
import 'package:we_grow/core/services/dialog_service.dart';
import 'package:we_grow/core/services/firestore_service.dart';
import 'package:we_grow/core/services/navigator_service.dart';

class HomeViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigatorService _navigatorService = locator<NavigatorService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();

  List<JobPost> _jobPosts;
  List<JobPost> get jobPosts => _jobPosts;

  Future fetchJobPosts() async {
    setBusy(true);
    var jobPostsResult = await _firestoreService.getJobPostsOnce();
    setBusy(false);

    if (jobPostsResult is List<JobPost>) {
      _jobPosts = jobPostsResult;
      notifyListeners();
    } else {
      await _dialogService.showDialog(
        title: "Failed to fetch job posts",
        description: jobPostsResult,
      );
    }
  }

  void listenToJobPosts() {
    setBusy(true);
    _firestoreService.listenToPostsRealTime().listen((jobPostsData) {
      List<JobPost> updatedJobPosts = jobPostsData;
      if (updatedJobPosts != null && updatedJobPosts.length > 0) {
        _jobPosts = updatedJobPosts;
        notifyListeners();
      }
      setBusy(false);
    });
  }

  void updateJobPost(int index) {
    _navigatorService.navigateTo(CreateJobPostViewRoute,
        arguments: _jobPosts[index]);
  }

  void deletePost(int index) async {
    var dialogResponse = await _dialogService.showConfirmationDialog(
      title: "Are you sure you want to delete?",
      description: "Delete ${_jobPosts[index].title}?",
      confirmationTitle: "Yes",
      cancelTitle: "No",
    );

    if (dialogResponse.confirmed) {
      setBusy(true);
      await _firestoreService.deleteJobPost(_jobPosts[index].documentId);
      setBusy(false);
    }
  }

  void navigateToCreateJobPostView() async {
    await _navigatorService.navigateTo(CreateJobPostViewRoute);
    await fetchJobPosts();
  }

  void logout() {
    this._authenticationService.logOutUser();
    _navigatorService.navigateTo(LoginViewRoute);
  }

  void navigateToSearchView() async {
    await _navigatorService.navigateTo(SearchViewRoute);
  }
}
