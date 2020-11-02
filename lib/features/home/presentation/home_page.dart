import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeStateInitial) {
          return Container();
        } else if (state is HomeStateSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.title),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('apiPath: ' + state.apiPath),
                    FlatButton(
                      color: Colors.grey,
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context)
                            .add(HomeEventDetailButtonTapped());
                      },
                      child: Text(state.buttonTitle),
                    ),
                  ],
                ),
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
    BlocProvider.of<HomeBloc>(context).add(HomeEventStarted());
  }
}
