import 'package:flutter/cupertino.dart';
import 'package:flutter_tutorial/design_pattern/mvc_pattern/source/use_momentum/model/counter_model.dart';
import 'package:momentum/momentum.dart';

class CounterController extends MomentumController<CounterModel> {
  @override
  CounterModel init() {
    return CounterModel(
      this,
      value: 0,
    );
  }

  void increment() {
    var value = model.value; // grab the current value
    model.update(value: value + 1); // update state (rebuild widgets)
    debugPrint("${model.value}"); // new or updated value
  }

  void reduce() {
    var value = model.value;
    if (value > 0) {
      model.update(value: value - 1);
    }
    debugPrint("${model.value}");
  }
}

/*
Có một cách ngắn gọn hơn để gọi hàm từ Momentum controller trong Flutter.
Đó là sử dụng một phương thức mở rộng (extension method)
hoặc sử dụng hàm toàn cục.
*/

// extension CounterControllerExtensions on MomentumController {
//   void incrementCounter() {
//     // Thực hiện công việc cần thiết khi tăng counter
//     // Ví dụ: this.controller<CounterController>().increment();
//   }
// }
// use: context.incrementCounter();
