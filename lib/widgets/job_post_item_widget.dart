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
      height: 80,
      margin: EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset("assets/images/icon_large.png",
                        fit: BoxFit.fill),
                  ),
                  horizontalSpaceTiny,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      if (post.description != null && post.description != "")
                        Text(
                          post.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
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
    );
  }
}
