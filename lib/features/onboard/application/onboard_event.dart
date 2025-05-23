part of 'onboard_bloc.dart';

abstract class OnboardEvent {}

class LoaderInitEvent extends OnboardEvent {}

class LoaderGetLocalDataEvent extends OnboardEvent {}

class UpdateUserLocationEvent extends OnboardEvent {}
