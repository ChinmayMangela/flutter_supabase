import 'package:flutter/material.dart';

class AppIcons {
  AppIcons._();

  static final auth = _Auth();
}

class _Auth {
  const _Auth();

  final email = Icons.email_outlined;
  final password = Icons.lock;
  final name = Icons.person_outlined;
  final  visibility = Icons.visibility;
  final  visibilityOff = Icons.visibility_off;
}
