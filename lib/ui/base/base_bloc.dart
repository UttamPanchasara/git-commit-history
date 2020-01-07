import 'package:git_demo/network/api_manager.dart';
import 'package:git_demo/network/viewstate.dart';
import 'package:rxdart/rxdart.dart';

class BaseBloc {
  ApiManager _apiManager = ApiManager();
  CompositeSubscription subscription = CompositeSubscription();

  Observable<ViewState<T>> handleAPICall<T>(Observable source,
      {customResponse}) {
    return _apiManager.callApi<T>(source, customResponse: customResponse);
  }

  void dispose() {
    subscription.clear();
  }
}
