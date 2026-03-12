import 'package:flutter/material.dart';
import 'package:flutter_supabase/core/constants/app_colors.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';
import 'package:flutter_supabase/core/utils/helper_functions.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final screenHeight = HelperFunctions.getScreenHeight(context);
    return Padding(
      padding: CustomPadding.screenPadding,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAppIcon()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppIcon() {
    return Container(
      padding: CustomPadding.iconPadding,
      decoration: BoxDecoration(
        borderRadius: CustomRadius.iconRadius,
        color: AppColors.black,
      ),
      child: Image.asset('assets/images/app_icon.png', height: 30),
    );
  }
}
