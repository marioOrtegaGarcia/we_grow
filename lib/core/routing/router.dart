import 'package:flutter/material.dart';
import 'package:we_grow/core/models/job_post.dart';
import 'package:we_grow/core/routing/route_names.dart';
import 'package:we_grow/views/create_job_post/create_job_post_view.dart';
import 'package:we_grow/views/create_user_information/create_user_information_view.dart';
import 'package:we_grow/views/home/home_view.dart';
import 'package:we_grow/views/login/login_view.dart';
import 'package:we_grow/views/profile/profile_view.dart';
import 'package:we_grow/views/search/search_view.dart';
import 'package:we_grow/views/sign_up/sign_up_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    case CreateJobPostViewRoute:
      var postToEdit = settings.arguments as JobPost;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CreateJobPostView(edittingPost: postToEdit),
      );
    case SearchViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SearchView(),
      );
    case ProfileViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ProfileView(),
      );
    case CreateUserInformation:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CreateUserInformationView(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
