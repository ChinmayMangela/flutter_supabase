import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_supabase/core/utils/dimen.dart';
import 'package:flutter_supabase/core/utils/helper_functions.dart';
import 'package:flutter_supabase/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_supabase/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_supabase/features/home/presentation/widgets/feature_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return Text('Hello ${(state as AuthSuccess).endUser.name}');
      }),
    );
  }

  Widget _buildBody() {
    final screenHeight = HelperFunctions.getScreenHeight(context);
    return Padding(padding: CustomPadding.screenPadding, child: SingleChildScrollView(
      child: Column(
        children: [
          FeatureCard(isFridgeVisionFeatureCard: true, onTap: () {}),
          SizedBox(height: screenHeight * 0.03),
          FeatureCard(isFridgeVisionFeatureCard: false, onTap: () {
            Navigator.of(context).pushNamed('/ingredientScannerScreen');
          })
        ],
      ),
    ),);
  }


}
