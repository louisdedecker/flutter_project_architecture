part of 'details_page_bloc.dart';

@immutable
abstract class DetailsPageState extends Equatable {}

class DetailsPageStateInitial extends DetailsPageState {
  @override
  List<Object> get props => [];
}

class DetailsPageStateSuccess extends DetailsPageState {
  final String title;
  final String buttonTitle;
  final DetailsPageRouterAction routerAction;

  DetailsPageStateSuccess({
    @required this.title,
    @required this.buttonTitle,
    this.routerAction,
  });

  DetailsPageState copyWith({
    DetailsPageRouterAction routerAction,
  }) {
    return DetailsPageStateSuccess(
      title: title,
      buttonTitle: buttonTitle,
      routerAction: routerAction ?? this.routerAction,
    );
  }

  @override
  List<Object> get props => [title, buttonTitle, routerAction];
}
