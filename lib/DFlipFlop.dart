//Flip Flop
//Done

import 'package:rohd/rohd.dart';
import 'dart:async';

class DFlipFlop extends Module {
  DFlipFlop({
    required d,
    required rst,
    required clk,
    super.name = 'dff',
  }) {
    d = addInput('d', d, width: 8);
    rst = addInput('rst', rst, width: 1);
    clk = addInput('clk', clk, width: 1);
    final q = addOutput('q', width: 8);
    Sequential(clk, [
      If(rst, then: [
        q < 0,
      ], orElse: [
        q < d,
      ])
    ]);
  }
}

Future<void> main() async {
  final d = Logic(name: 'd', width: 8);
  final rst = Logic(name: 'rst', width: 1);
  final clk = Logic(name: 'clk', width: 1);
  final mod = DFlipFlop(d: d, rst: rst, clk: clk);

  await mod.build();
  print(mod.generateSynth());
}
