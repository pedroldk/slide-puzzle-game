// ignore_for_file: public_member_api_docs

part of 'music_control_bloc.dart';

abstract class MusicControlEvent extends Equatable {
  const MusicControlEvent();

  @override
  List<Object> get props => [];
}

class MusicChanged extends MusicControlEvent {
  const MusicChanged(this.music);

  final String music;

  @override
  List<Object> get props => [music];
}
