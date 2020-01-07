import 'package:git_demo/network/client/api_client.dart';
import 'package:git_demo/network/rest_constants.dart';
import 'package:git_demo/network/rx_converter.dart';
import 'package:git_demo/ui/githistory/data/git_commit_data.dart';
import 'package:rxdart/rxdart.dart';

class GitHistoryApiDS extends RxConverter {
  Observable<List<GitCommitData>> getCommitHistory() {
    return callApi(ApiClient().dio().get(
          RestConstants.GET_GIT_COMMIT_HISTORY,
        )).map((response) {
      return ApiData.fromJson(response.data).gitData;
    });
  }
}
