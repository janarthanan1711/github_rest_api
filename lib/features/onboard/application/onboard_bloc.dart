import 'package:bloc/bloc.dart';
import 'package:github_repo/common/local_data.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc() : super(LoaderInitialState()) {
    on<LoaderGetLocalDataEvent>(loadData);
  }
  Future<void> loadData(
    LoaderGetLocalDataEvent event,
    Emitter<OnboardState> emit,
  ) async {
    final loginStatus = await AppSharedPreference.getLoginStatus();
    emit(LoaderSuccessState(loginStatus: loginStatus));
  }
}
