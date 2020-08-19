import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:we_grow/core/models/user.dart';
import 'package:we_grow/core/services/authentication_service.dart';
import '../locator.dart';
import '../logger.dart';

class BaseViewModel extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  String _title;
  bool _busy;
  Logger log;
  bool _isDisposed = false;

  BaseViewModel({
    bool busy = false,
    String title,
  })  : _busy = busy,
        _title = title {
    log = getLogger(title ?? this.runtimeType.toString());
  }

  bool get busy => this._busy;
  bool get isDisposed => this._isDisposed;
  String get title => _title ?? this.runtimeType.toString();
  User get currentUser => _authenticationService.currentUser;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  set busy(bool busy) {
    log.i(
      'busy: '
      '$title is entering '
      '${busy ? 'busy' : 'free'} state',
    );
    this._busy = busy;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!isDisposed) {
      super.notifyListeners();
    } else {
      log.w('notifyListeners: Notify listeners called after '
          '${title ?? this.runtimeType.toString()} has been disposed');
    }
  }

  @override
  void dispose() {
    log.i('dispose');
    _isDisposed = true;
    super.dispose();
  }
}
