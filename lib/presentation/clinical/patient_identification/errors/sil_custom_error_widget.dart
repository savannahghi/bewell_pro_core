import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/clinical/entities/sil_custom_exceptions.dart';
import 'package:debug_logger/debug_logger.dart';

class SILUserException extends StatelessWidget {
  const SILUserException({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CoreState, _ViewModel>(
      vm: () => _Factory(this),
      builder: (BuildContext context, _ViewModel vm) =>
          SILUserExceptionWidgetContent(error: vm.error, child: child),
    );
  }
}

class SILUserExceptionWidgetContent extends StatefulWidget {
  const SILUserExceptionWidgetContent(
      {Key? key, this.error, required this.child})
      : super(key: key);

  final Widget child;
  final Event<UserException>? error;

  @override
  _SILUserExceptionWidgetContentState createState() =>
      _SILUserExceptionWidgetContentState();
}

class _SILUserExceptionWidgetContentState
    extends State<SILUserExceptionWidgetContent> {
  late Widget _currentWidget;

  @override
  void didUpdateWidget(SILUserExceptionWidgetContent oldWidget) {
    super.didUpdateWidget(oldWidget);

    final UserException? exception = widget.error!.consume();

    if (exception != null) {
      DebugLogger.debug('Exception from inside: $exception');

      if (exception is UserNotFoundException) {
        setState(() => _currentWidget = const Text('User not found'));
      }
      if (exception is ErrorWhileSearchingException) {
        setState(() => _currentWidget = const Text('Error while searching'));
      } else {
        setState(() => _currentWidget = const Text('Other error'));
      }
    } else {
      // _currentWidget = widget.child;
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() => _currentWidget = widget.child);
  }

  @override
  Widget build(BuildContext context) => _currentWidget;
}

class _Factory extends VmFactory<CoreState, SILUserException> {
  _Factory(SILUserException widget) : super(widget);

  @override
  Vm fromStore() => _ViewModel(Event<UserException>(getAndRemoveFirstError()));
}

class _ViewModel extends Vm {
  _ViewModel(this.error) : super(equals: <UserException?>[error!.state]);

  final Event<UserException>? error;

  /// Does not respect equals contract:
  /// A==B ➜ true only if B.error.state is not null.
  @override
  bool operator ==(Object other) {
    return error!.state == null;
  }

  @override
  int get hashCode => error.hashCode;
}
