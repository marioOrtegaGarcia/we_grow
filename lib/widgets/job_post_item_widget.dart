import 'package:flutter/material.dart';
import 'package:we_grow/core/locator.dart';
import 'package:we_grow/core/models/job_post.dart';
import 'package:we_grow/core/services/authentication_service.dart';
import 'package:we_grow/theme/shared_styles.dart';
import 'package:we_grow/theme/ui_helpers.dart';

class JobPostItemWidget extends StatelessWidget {
  final JobPost post;
  final Function onDeleteItem;

  const JobPostItemWidget({
    Key key,
    this.post,
    this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset("assets/images/icon_large.png"),
                  ),
                  horizontalSpaceTiny,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post.title,
                      ),
                      if (post.description != null && post.description != "")
                        Text(post.description != null ? post.description : ""),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (post.userId == locator<AuthenticationService>().currentUser.id)
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                if (onDeleteItem != null) {
                  onDeleteItem();
                }
              },
            ),
        ],
      ),
      decoration: fieldDecoration,
      // decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(5),
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black,
      //         offset: Offset(2.0, 2.0),
      //         blurRadius: 5,
      //       ),
      //       BoxShadow(
      //         color: Colors.white,
      //         offset: Offset(-2.0, -2.0),
      //         blurRadius: 5,
      //       ),
      //       BoxShadow(
      //         blurRadius: 8,
      //         color: Colors.grey[200],
      //         spreadRadius: 3,
      //       )
      //     ]),
    );
  }
}
