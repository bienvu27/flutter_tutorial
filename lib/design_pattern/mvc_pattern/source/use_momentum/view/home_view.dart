import 'package:flutter/material.dart';
import 'package:flutter_tutorial/design_pattern/mvc_pattern/source/use_momentum/controller/counter_controller.dart';
import 'package:flutter_tutorial/design_pattern/mvc_pattern/source/use_momentum/model/counter_model.dart';
import 'package:momentum/momentum.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MomentumBuilder(
        controllers: const [CounterController],
        builder: (context, snapshot) {
          final controller = snapshot<CounterModel>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Momentum Counter'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${controller.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            // we don't need to rebuild the increment button, we can skip the MomentumBuilder
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed:
                      Momentum.controller<CounterController>(context).increment,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed:
                  Momentum.controller<CounterController>(context).reduce,
                  tooltip: 'Reduce',
                  child: const Icon(Icons.minimize),
                ),
              ],
            ),
          );
        });
  }
}
