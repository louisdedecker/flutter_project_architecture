import 'package:meta/meta.dart';

abstract class HttpClient {}

class HttpClientImpl extends HttpClient {
  final String basePath;

  HttpClientImpl({@required this.basePath});
}
