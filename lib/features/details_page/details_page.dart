import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/details_page_bloc.dart';
import 'presentation/details_page_page.dart';
import 'presentation/details_page_router.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetailsPageBloc(),
      child: DetailsPageRouter(
        child: DetailsPagePage(),
      ),
    );
  }
}
