import 'package:git_demo/network/api_manager.dart';
import 'package:git_demo/network/viewstate.dart';
import 'package:git_demo/ui/githistory/ds/git_history_api_ds.dart';
import 'package:rxdart/rxdart.dart';

class GitHistoryRepo {
  ApiManager _apiManager = ApiManager();
  GitHistoryApiDS _apiDS = GitHistoryApiDS();

  Observable<ViewState> getCommitHistory() {
    return _apiManager.callApi(_apiDS.getCommitHistory());
  }
}
