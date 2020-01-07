import 'package:flutter/material.dart';
import 'package:git_demo/ui/widgets/custom_border_button.dart';
import 'package:git_demo/utils/app_utils.dart';

import 'data/git_commit_data.dart';

class CommitList extends StatelessWidget {
  final List<GitCommitData> commitsList;

  const CommitList({@required this.commitsList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Container(
        height: 5.0,
      ),
      shrinkWrap: true,
      itemCount: commitsList.length,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      itemBuilder: (context, position) {
        GitCommitData gitList = this.commitsList[position];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _listItem(gitList),
          ],
        );
      },
    );
  }

  Widget _listItem(GitCommitData value) {
    return Card(
      elevation: 0.0,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Flexible(
                      child: Text(
                        value.commit.message,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  value.commit.verification.verified
                      ? Center(
                          child: CustomBorderButton(
                            onPressed: () {},
                            width: 70.0,
                            height: 25.0,
                            text: 'Verified',
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  FadeInImage(
                    placeholder: AssetImage('assets/images/ic_placeholder.png'),
                    image: NetworkImage(_getAvatarUrl(value.author)),
                    width: 18.0,
                    height: 18.0,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  _listText(_getAuthorName(value.author), Colors.black),
                  SizedBox(
                    width: 5.0,
                  ),
                  _listText(
                      "commited ${getDate(value.commit.committer.date, 'd MMM y')}",
                      Colors.black54.withOpacity(0.4)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listText(String value, Color color) {
    return Container(
      child: Text(
        value,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        softWrap: true,
        style: TextStyle(fontSize: 14.0, color: color),
        textAlign: TextAlign.left,
      ),
    );
  }

  String _getAvatarUrl(Author author) {
    if (author != null) {
      return author?.avatarUrl ?? '';
    }
    return '';
  }

  String _getAuthorName(Author author) {
    if (author != null) {
      return author?.login ?? '';
    }
    return '';
  }
}
