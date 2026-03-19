import 'package:flutter/material.dart';

class AppIcons {
  AppIcons._();

  static final auth = _Auth();
  static final home = _Home();
}

class _Auth {
  const _Auth();

  final email = Icons.email_outlined;
  final password = Icons.lock;
  final name = Icons.person_outlined;
  final  visibility = Icons.visibility;
  final  visibilityOff = Icons.visibility_off;
}


class _Home {
  const _Home();

  final flashOn = Icons.flash_on;
  final flashOff = Icons.flash_off;
  final galleryIcon = Icons.photo_library_sharp;
}
