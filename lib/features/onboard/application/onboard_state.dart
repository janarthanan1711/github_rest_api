part of 'onboard_bloc.dart';

abstract class OnboardState {}

final class LoaderInitialState extends OnboardState {}

final class LoaderSuccessState extends OnboardState {
  final bool loginStatus;
  LoaderSuccessState({required this.loginStatus});
}
