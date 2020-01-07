import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:git_demo/data/Booking/gitData.dart';
import 'package:git_demo/ui/git_list.dart';
import 'package:git_demo/ui/git_repo.dart';
import 'package:git_demo/ui/git_view.dart';

class Git extends StatefulWidget {
  final String title;

  Git({this.title});

  @override
  _GitState createState() => _GitState();
}

class _GitState extends State<Git> implements GitView {
  GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  GitRepo _repo;
  bool isLoading = false;
  StreamController _dataListBehavior;

  @override
  void initState() {
    _repo = new GitRepo(view: this);
    _dataListBehavior = new StreamController<ApiData>();
    _doApiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColorDark));
    return Scaffold(
      key: _globalKey,
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
      body: Stack(children: <Widget>[
        _streamData(),
        isLoading ? Center(child: CircularProgressIndicator()) : Container()
      ]),
    );
  }

  Widget _streamData() {
    return  StreamBuilder(
      stream: _dataListBehavior.stream,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return _body(snapshot.data);
        }
        return Container();
      },
    );
  }


  _body(ApiData data) {
    if (data == null) {
      return Container();
    }
    return _listDataView(data.gitData);
  }

  Widget _listDataView(List<GitData> gitList) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),

      child: GitListView(
        gitList: gitList,
        callback: () {},
      ),
    );
  }

  void _doApiCall() {
    _repo.doGetData();
  }

  @override
  void hideProgress() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void onDataAvailable(data) {
    print('Git DATA: $data');

    if(data is ApiData){
      _dataListBehavior.add(data);
    }
  }

  @override
  void onError(String key) {
  }

  @override
  void showError(String errorMessage) {
    var snackBar = _snackBarView(errorMessage, Colors.red);
    _globalKey.currentState.showSnackBar(snackBar);
  }

  Widget _snackBarView(String errorMessage, Color red) {
    return SnackBar(
      content: Text(errorMessage),
      backgroundColor: Colors.red,
    );
  }

  @override
  void showProgress() {
    setState(() {
      isLoading = true;
    });
  }
}
