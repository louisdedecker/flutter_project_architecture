import 'package:architecture_template/common/http_client/http_client.dart';
import 'package:architecture_template/common/repositories/analytics_repository/analytics_repository.dart';
import 'package:architecture_template/common/repositories/local_storage/local_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationRepository {
  Stream<bool> onAuthenticated;
  Future<bool> authenticate({String email});
  Future<bool> logOut();
  void dispose();
}

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AnalyticsRepository analyticsRepository;
  final HttpClient httpClient;
  final LocalStorage localStorage;
  final _onAuthenticated = BehaviorSubject<bool>();
  static const _authenticatedKey = 'authenticated';

  Stream<bool> get onAuthenticated => _onAuthenticated.stream;

  AuthenticationRepositoryImpl({
    @required this.analyticsRepository,
    @required this.httpClient,
    @required this.localStorage,
  })  : assert(analyticsRepository != null),
        assert(httpClient != null),
        assert(localStorage != null) {
    start();
  }

  void start() async {
    var authenticated = await localStorage.boolValueForKey(_authenticatedKey);
    _onAuthenticated.add(authenticated ?? false);
  }

  Future<bool> authenticate({String email}) {
    //if (email == "a") {
    localStorage.setBoolValueForKey(true, _authenticatedKey);
    _onAuthenticated.add(true);
    return Future.value(true);
    //}
    //return Future.value(false);
  }

  Future<bool> logOut() async {
    await localStorage.setBoolValueForKey(false, _authenticatedKey);
    _onAuthenticated.add(false);
    return true;
  }

  void dispose() {
    _onAuthenticated.close();
  }
}
