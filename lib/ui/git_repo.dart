import 'package:flutter/material.dart';
import 'package:git_demo/data/Booking/gitData.dart';
import 'package:git_demo/network/api_manager.dart';
import 'package:git_demo/ui/git_ds.dart';
import 'package:git_demo/ui/git_view.dart';
import 'package:git_demo/ui/view/base_repo.dart';

class GitRepo extends BaseRepo {
  final GitView view;

  GitDs _dataGitData = GitDs();

  ApiManager _apiManager = new ApiManager();

  GitRepo({
    @required this.view,
  });

  void doGetData() {
    var observable = _dataGitData.callApiData().map((response) {
      print("Response: $response");

      return ApiData.fromJson(response);
    });
    _apiManager.subscribeObserver(observable, view);
  }
}
