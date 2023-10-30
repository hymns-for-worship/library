import 'package:flutter/widgets.dart';

import 'signal.dart';

class SignalWatch<T> extends StatefulWidget {
  const SignalWatch({
    super.key,
    this.child,
    required this.signal,
    required this.builder,
  });

  final Signal<T> signal;
  final Widget? child;
  final Widget Function(BuildContext context, T value, Widget? child) builder;

  @override
  State<SignalWatch<T>> createState() => _SignalWatchState<T>();
}

class _SignalWatchState<T> extends State<SignalWatch<T>> {
  late T value = widget.signal.value;

  @override
  void initState() {
    super.initState();
    widget.signal.addListener(() {
      if (mounted) {
        setState(() {
          value = widget.signal.value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, value, widget.child);
  }
}
