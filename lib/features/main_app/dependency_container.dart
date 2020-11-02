import 'package:architecture_template/common/http_client/http_client.dart';
import 'package:architecture_template/common/repositories/analytics_repository/analytics_repository.dart';
import 'package:architecture_template/common/repositories/authentication_repository/authentication_repository.dart';
import 'package:architecture_template/common/repositories/local_storage/local_storage.dart';
import 'package:architecture_template/environment.dart';
import 'package:architecture_template/features/main_app/main_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class DependencyContainer extends StatefulWidget {
  final Environment environment;
  final Widget child;

  const DependencyContainer({
    Key key,
    @required this.environment,
    @required this.child,
  })  : assert(child != null),
        assert(environment != null),
        super(key: key);

  @override
  _DependencyContainerState createState() => _DependencyContainerState();
}

class _DependencyContainerState extends State<DependencyContainer> {
  HttpClient _httpClient;
  AnalyticsRepository _analyticsRepository;
  AuthenticationRepository _authenticationRepository;
  LocalStorage _localStorage;

  @override
  void initState() {
    _localStorage = LocalStorageImpl();
    _httpClient = HttpClientImpl(
      basePath: widget.environment.apiPath,
    );
    _analyticsRepository = AnalyticsRepositoryImpl();
    _authenticationRepository = AuthenticationRepositoryImpl(
      analyticsRepository: _analyticsRepository,
      httpClient: _httpClient,
      localStorage: _localStorage,
    );
    Bloc.observer = MainBlocObserver();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Environment>(
          create: (context) => widget.environment,
        ),
        Provider<AuthenticationRepository>(
          dispose: (_, value) => value.dispose(),
          create: (context) => _authenticationRepository,
        ),
        Provider<AnalyticsRepository>(
          create: (context) => _analyticsRepository,
        ),
      ],
      child: widget.child,
    );
  }
}
