import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failures.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.clientFilure() = _clientFilure;
  const factory MainFailure.serverFailure() = _serverFailure;
}
