// ignore_for_file: public_member_api_docs

part of 'music_control_bloc.dart';

class MusicControlState extends Equatable {
  const MusicControlState({
    this.music = 'None'
  });

  /// The music being played.
  final String music;

  @override
  List<Object> get props => [music];
}
