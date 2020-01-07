import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:git_demo/ui/githistory/bloc/git_history_bloc.dart';
import 'package:git_demo/ui/githistory/commit_list.dart';
import 'package:git_demo/ui/widgets/state_handler.dart';

import 'data/git_commit_data.dart';

class GitHistory extends StatefulWidget {
  final String title;

  GitHistory({this.title});

  @override
  _GitHistoryState createState() => _GitHistoryState();
}

class _GitHistoryState extends State<GitHistory> {
  GitHistoryBloc _bloc = GitHistoryBloc();

  @override
  void initState() {
    super.initState();
    _bloc.getCommitHistory();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColorDark));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColorLight,
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder(
        stream: _bloc.viewState,
        builder: (context, snapshot) {
          return StateHandler(
            body: _listDataView(snapshot?.data?.data ?? []),
            viewState: snapshot?.data,
          );
        },
      ),
    );
  }

  Widget _listDataView(List<GitCommitData> commitsList) {
    return Container(
      child: CommitList(
        commitsList: commitsList,
      ),
    );
  }
}
