import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class BaseModel extends ChangeNotifier implements Equatable {
  Map<String, Object> toMap();
  bool _busy = false;
  bool get busy => _busy;
}
