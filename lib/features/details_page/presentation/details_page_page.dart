import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/details_page_bloc.dart';

class DetailsPagePage extends StatefulWidget {
  @override
  _DetailsPagePageState createState() => _DetailsPagePageState();
}

class _DetailsPagePageState extends State<DetailsPagePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsPageBloc, DetailsPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DetailsPageStateInitial) {
          return Container();
        } else if (state is DetailsPageStateSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.title),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  FlatButton(
                    onPressed: () {
                      BlocProvider.of<DetailsPageBloc>(context)
                          .add(DetailsPageEventNextButton());
                    },
                    child: Text(state.buttonTitle),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailsPageBloc>(context).add(DetailsPageEventStarted());
  }
}
