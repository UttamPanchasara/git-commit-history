import 'package:flutter/material.dart';
import 'package:git_demo/data/Booking/gitData.dart';
import 'package:git_demo/ui/view/custom_border_button.dart';
import 'package:intl/intl.dart';

class GitListView extends StatelessWidget {
  final List<GitData> gitList;
  final Function callback;

  const GitListView({@required this.gitList, @required this.callback});

  @override
  Widget build(BuildContext context) {
    Widget listItem(GitData value, Color primaryColor) {
      return Card(
        elevation: 0.0,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).primaryColorLight.withOpacity(0.1))),
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 35.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: value.commit.verification.verified
                          ? MediaQuery.of(context).size.width - 120
                          : MediaQuery.of(context).size.width - 40,
                      child: Text(
                        value.commit.message,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.left,
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
              Row(
                children: <Widget>[
                  Image.network(
                    _getAvatarUrl(value.author),
                    height: 18.0,
                    width: 18.0,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  _listText(_getAuthorname(value.author), Colors.black),
                  SizedBox(
                    width: 5.0,
                  ),
                  _listText(
                      "Commited On ${_getDate(value.commit.committer.date)}",
                      Colors.black54.withOpacity(0.4)),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      separatorBuilder: (context, index) => Container(
        height: 5.0,
      ),
      shrinkWrap: true,
      itemCount: gitList.length,
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      itemBuilder: (context, position) {
        GitData gitList = this.gitList[position];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            listItem(gitList, Theme.of(context).primaryColorDark),

          ],
        );

      },
    );
  }

  Widget _listText(String value, Color color) {
    return Container(
      child: Wrap(
        children: <Widget>[
          Text(
            value,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: true,
            style: TextStyle(fontSize: 14.0, color: color),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  String _getAvatarUrl(Author author) {
    if (author != null) {
      return author?.avatarUrl ?? '';
    }
    return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe76emZ89ZZEgUHhtbnCPlp9NrQAp2-5NuVSmTCl_u6iqA0mgn&s';
  }

  String _getAuthorname(Author author) {
    if (author != null) {
      return author?.login ?? '';
    }
    return '';
  }

  _getDate(String date) {
    if (date != null) {

      var day = new DateFormat.d("en_US").format(DateTime.parse(date));
      var moth = new DateFormat.MMM("en_US").format(DateTime.parse(date));
      var year = new DateFormat.y("en_US").format(DateTime.parse(date));

      return "$day $moth $year";
    }
    return "";
  }
}
