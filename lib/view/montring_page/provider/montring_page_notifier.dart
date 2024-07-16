import 'dart:async';
import 'package:audioplayers/audioplayers.dart' as audioplayers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'montring_page_notifier.freezed.dart';

@freezed
class MontringPageState with _$MontringPageState {
  factory MontringPageState({
    @Default(0) int totalSeconds,
    @Default(0) int dynamicSeconds,
    @Default(false) bool isRunning,
    Timer? timer,
    required audioplayers.AudioPlayer audioPlayer,
    @Default(null) audioplayers.AssetSource? audioPlayerSource,
  }) = _MontringPageState;
  MontringPageState._();
}

final montringPageProvider =
    StateNotifierProvider<MontringPageStateController, MontringPageState>(
        (ref) => MontringPageStateController());

class MontringPageStateController extends StateNotifier<MontringPageState> {
  MontringPageStateController()
      : super(MontringPageState(audioPlayer: audioplayers.AudioPlayer())) {
    _init();
  }

  bool get getIsRunning => state.isRunning;

  void _init() {
    setTimer();
  }

  void setTimer() {
    state = state.copyWith(totalSeconds: 10);
    state = state.copyWith(dynamicSeconds: 10);
  }

  void changeIsRunningState(bool isRunning) {
    state = state.copyWith(isRunning: isRunning);
  }

  Future<void> startTimer() async {
    changeIsRunningState(true);
    state = state.copyWith(
      timer: Timer.periodic(
        const Duration(seconds: 1),
        (_) {
          if (state.dynamicSeconds > 0) {
            state = state.copyWith(dynamicSeconds: state.dynamicSeconds - 1);
          } else {
            stopTimer();
            playSoundTimeUp();
          }
        },
      ),
    );
  }

  void resetTimer() {
    state.audioPlayer.stop();
    state = state.copyWith(dynamicSeconds: state.totalSeconds);
  }

  void stopTimer() {
    state.audioPlayer.stop();
    state.timer?.cancel();
    changeIsRunningState(false);
  }

  Future<void> playSoundTimeUp() async {
    await state.audioPlayer.setReleaseMode(audioplayers.ReleaseMode.loop);
    state = state.copyWith(
      audioPlayerSource: audioplayers.AssetSource('sounds/timeup.mp3'),
    );
    state.audioPlayer.play(state.audioPlayerSource!);
  }

  @override
  void dispose() {
    state.timer?.cancel();
    state.audioPlayer.dispose();
    super.dispose();
  }
}
