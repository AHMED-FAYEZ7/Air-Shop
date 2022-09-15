import 'dart:async';

import 'package:air_shop/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/subjects.dart';

abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs{

  final StreamController _inputStateStreamController = BehaviorSubject<FlowState>();

  @override
  Sink get inputState => _inputStateStreamController.sink;

  @override
  Stream<FlowState> get outputState => _inputStateStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStateStreamController.close();
  }

}

abstract class BaseViewModelInputs {
  void start();
  void dispose();

  Sink get inputState;
}
abstract class BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}