import 'package:architecture_template/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/home_bloc.dart';
import 'presentation/home_page.dart';
import 'presentation/home_router.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var apiPath = Provider.of<Environment>(context, listen: false).apiPath;
    return BlocProvider(
      create: (_) => HomeBloc(
        apiPath: apiPath,
      ),
      child: HomeRouter(
        child: HomePage(),
      ),
    );
  }
}
