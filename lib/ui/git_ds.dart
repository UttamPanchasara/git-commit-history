import 'package:dio/dio.dart';
import 'package:git_demo/network/client/api_client.dart';
import 'package:git_demo/network/rx_converter.dart';
import 'package:rxdart/rxdart.dart';

class GitDs<T> extends RxConverter {
  Observable<dynamic> callApiData() {

    var url="https://api.github.com/repos/UttamPanchasara/PDF-Generator/commits";

    return callApi(
      ApiClient().dio().get(
        url,
        options: Options(headers: {ApiClient.REQUIRES_HEADER: false}),
      ),
    ).map((response) {
      return returnResponse(response);
    });
  }
}