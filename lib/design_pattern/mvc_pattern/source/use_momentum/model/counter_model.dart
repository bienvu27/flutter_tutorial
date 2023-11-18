import 'package:flutter_tutorial/design_pattern/mvc_pattern/source/use_momentum/controller/counter_controller.dart';
import 'package:momentum/momentum.dart';

class CounterModel extends MomentumModel<CounterController> {
  const CounterModel(
    CounterController controller, {
    required this.value,
  }) : super(controller);

  final int value;

  @override
  void update({
    int? value,
  }) {
    CounterModel(
      controller,
      value: value ?? this.value,
    ).updateMomentum();
  }
}
