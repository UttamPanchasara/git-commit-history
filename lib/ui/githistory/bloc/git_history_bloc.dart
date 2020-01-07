import 'package:git_demo/network/viewstate.dart';
import 'package:git_demo/ui/base/base_bloc.dart';
import 'package:git_demo/ui/githistory/repo/git_history_repo.dart';
import 'package:rxdart/rxdart.dart';

class GitHistoryBloc extends BaseBloc {
  GitHistoryRepo _repo = GitHistoryRepo();
  var viewState = PublishSubject<ViewState>();

  void getCommitHistory() {
    subscription.add(
      _repo.getCommitHistory().listen((viewState) {
        this.viewState.add(viewState);
      }, onError: (error) => {}),
    );
  }

  @override
  void dispose() {
    super.dispose();
    viewState?.close();
  }
}
