import 'dart:math';

import 'package:epic_clicker/model/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';

import '/effects/confetti.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late ConfettiController _confettiController;

  final AudioPlayer player = AudioPlayer();
  static const confettiAudioPath = "audios/confetti.mp3";

  @override
  void initState() {
    _confettiController =
        ConfettiController(duration: const Duration(milliseconds: 500));

    super.initState();
  }

  Future<void> playSound() async {
    await player.play(AssetSource(confettiAudioPath));
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
      child: Consumer<CounterModel>(builder: (context, counter, _) {
        return Column(
          children: [
            const SizedBox(height: 40),
            Text(
              "${counter.counterValue}",
              style: const TextStyle(fontSize: 70),
            ),
            const SizedBox(height: 75),
            ConfettiWidget(
              confettiController: _confettiController,
              createParticlePath: drawStar,
              blastDirection: 3 * pi / 2,
              emissionFrequency: 0.02,
              child: const SizedBox(
                height: 40,
              ),
            ),
            const SizedBox(height: 75),
            Ink(
              decoration: const ShapeDecoration(
                color: Colors.amber,
                shape: CircleBorder(),
              ),
              child: IconButton(
                iconSize: 40,
                padding: const EdgeInsets.all(50),
                onPressed: () {
                  counter.increment();
                  if (counter.counterValue % 50 == 0) {
                    _confettiController.play();
                    playSound();
                  }
                },
                highlightColor: Colors.amberAccent,
                icon: const Icon(Icons.add),
                color: Colors.white,
              ),
            ),
          ],
        );
      }),
    );
  }
}
