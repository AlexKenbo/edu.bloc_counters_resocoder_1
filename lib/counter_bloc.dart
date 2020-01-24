import 'package:bloc/bloc.dart';
import 'package:bloc_resocoder_package_1/counter_event.dart';
import 'package:bloc_resocoder_package_1/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  void onIncrement() {
    dispatch(IncrementEvent());
  }

  void onDecrement() {
    dispatch(DecrementEvent());
  }

  @override
  CounterState get initialState => CounterState.initial();
  
  @override
  Stream<CounterState> mapEventToState(
    //
    CounterEvent event,
  ) async* {
    print('run mapEventToState() - ${event.runtimeType} = ${currentState.counter}');
    final _currentState = currentState;
    if (event is IncrementEvent) {
      yield CounterState(counter: currentState.counter + 1 );
    } else if (event is DecrementEvent) {
      yield CounterState(counter: currentState.counter - 1 );
    }
  }
}
