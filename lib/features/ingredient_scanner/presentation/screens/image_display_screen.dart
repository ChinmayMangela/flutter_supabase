import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/utils/helper_functions.dart';

class ImageDisplayScreen extends StatefulWidget {
  const ImageDisplayScreen({super.key, required this.image});

  final XFile image;

  @override
  State<ImageDisplayScreen> createState() => _ImageDisplayScreenState();
}

class _ImageDisplayScreenState extends State<ImageDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      height: HelperFunctions.getScreenHeight(context),
      width: HelperFunctions.getScreenWidth(context),
      child: Image.file(File(widget.image.path), fit: BoxFit.fill,),
    );
  }
}
