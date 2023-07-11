import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:epic_clicker/effects/confetti.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final ValueNotifier<int> _counterValue = ValueNotifier<int>(0);

  late ConfettiController _confettiController;

  static AudioPlayer player = AudioPlayer();
  static const confettiAudioPath = "audios/confetti.mp3";

  @override
  void initState() {
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));

    _counterValue.addListener(() async {
      if (_counterValue.value % 50 == 0) {
        _confettiController.play();
        await player.play(AssetSource(confettiAudioPath));
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            "${_counterValue.value}",
            style: const TextStyle(fontSize: 70),
          ),
          const SizedBox(height: 75),
          ConfettiWidget(
            confettiController: _confettiController,
            createParticlePath: drawStar,
            blastDirection: 3 * pi / 2,
            emissionFrequency: 0.01,
            child: const SizedBox(
              height: 40,
            ),
          ),
          const SizedBox(height: 75),
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.amber,
            child: IconButton(
              iconSize: 40,
              padding: const EdgeInsets.all(50),
              onPressed: () {
                setState(() => _counterValue.value++);
              },
              highlightColor: Colors.amberAccent,
              icon: const Icon(Icons.add),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
