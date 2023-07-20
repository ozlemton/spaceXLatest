import 'package:spacex/blocs/app_blocs.dart';
import 'package:spacex/blocs/app_events.dart';
import 'package:spacex/blocs/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/repositories.dart';

class SpaceXBloc extends Bloc<SpaceXEvent,SpaceXState>{
  late final SpaceXRepository _spaceXRepository;

  SpaceXBloc(this._spaceXRepository) : super(SpaceXLoadingState()) {
    on<LoadSpaceXEvent>((event, emit) async {
      emit(SpaceXLoadingState());
      try {
        final spaceX = await _spaceXRepository.getSpaceX();
        emit(SpaceXLoadedState(spaceX));
      } catch (e) {
        emit(SpaceXErrorState(e.toString()));
      }
    });
  }

}