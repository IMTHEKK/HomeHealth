import 'package:rxdart/rxdart.dart';
import 'package:untitled3/network/api_handler.dart';

class CommonBloc<T> {
  final _repository = Repository();
  final _postLogin = PublishSubject<T>();

  //Observable<T> get _loginUser => _postLogin.stream;

  Future<dynamic> hitGetApi(String apiUrl) async {
    Future<dynamic> itemModel = _repository.hitGetApi(apiUrl);
    return itemModel;
  }

  Future<dynamic> hitPostApi(Map<String, dynamic> bodyParams, String apiUrl) async {
    Future<dynamic> itemModel = _repository.hitPostApi(bodyParams, apiUrl);
    return itemModel;
  }

  dispose() {
    _postLogin.close();
  }
}

final commonBloc = CommonBloc();
