import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/authentication_bloc.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {},
      builder: (context, state) {
        Widget content = Container();
        if (state is AuthenticationSuccess) {
          content = Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (value) {},
                    //style: AppTextStyles.regularBlue,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      isDense: true,
                      hintText: "input email",
                      //hintStyle: AppTextStyles.regularGrey,
                      border: InputBorder.none,
                    ),
                    controller: controller,
                  ),
                ),
              ),
              FlatButton(
                color: Colors.grey,
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(
                      AuthenticationEventContinueButton(
                          value: controller.text));
                },
                child: Text(state.buttonTitle),
              ),
            ],
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(state.title),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: content,
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthenticationBloc>(context)
        .add(AuthenticationEventStarted());
  }
}
