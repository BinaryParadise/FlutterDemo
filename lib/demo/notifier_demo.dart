import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends ChangeNotifier {
  int value = 0;
  void increment() {
    value += 1;
    notifyListeners();
  }
}

ValueNotifier<int> _valueNotifier = ValueNotifier<int>(0);

class NotifierDemo extends StatelessWidget {
  const NotifierDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget current;
    Widget changeNotifier = Column(
      children: [
        const Text('ChangeNotifier: 应用于指定上下文需要同步更新场景'),
        Consumer<Counter>(
            builder: (context, counter, child) => Text('${counter.value}')),
        TextButton(
            onPressed: () => context.read<Counter>().increment(),
            child: const Text('Increment'))
      ],
    );

    Widget valueNotifier = Column(
      children: [
        const Text('ValueNotifier: 应用于全局或者局部的更新场景'),
        ValueListenableBuilder<int>(
            valueListenable: _valueNotifier,
            builder: (context, value, child) => Text(value.toString())),
        TextButton(
            onPressed: () => _valueNotifier.value += 1,
            child: const Text('Increment')),
      ],
    );
    current = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: changeNotifier),
        Expanded(child: valueNotifier)
      ],
    );
    current = Padding(
      padding: const EdgeInsets.all(12),
      child: current,
    );
    current = Scaffold(
      appBar: AppBar(title: Text('Notifier')),
      body: current,
    );
    return current;
  }
}
