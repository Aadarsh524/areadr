import 'package:areadr/layers/blocs/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreadrScreen extends StatelessWidget {
  const AreadrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Sign out logic here
              BlocProvider.of<AuthCubit>(context).signOut();
            },
            child: const Text('signOut'),
          ),
        ),
      ),
    );
  }
}
