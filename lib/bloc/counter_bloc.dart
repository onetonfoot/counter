import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(
    CounterEvent event,
  ) async* {
    debugPrint("$event");
    if (event is Increment) {
      debugPrint("What the fuck");
      yield state + 1;
    } else if (event is Decrement) {
      yield state - 1;
    }
  }
}
