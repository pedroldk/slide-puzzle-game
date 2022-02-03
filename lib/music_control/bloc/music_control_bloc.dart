// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'music_control_event.dart';
part 'music_control_state.dart';

class MusicControlBloc extends Bloc<MusicControlEvent, MusicControlState> {
  MusicControlBloc() : super(const MusicControlState()) {
    on<MusicChanged>(_onMusicChanged);
  }

  void _onMusicChanged(MusicChanged event, Emitter<MusicControlState> emit) {
    emit(MusicControlState(music: event.music));
  }
}
