import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_app/di/di.dart' as get_it;
import 'package:schedule_app/presentation/screens/landing_screen.dart';
import 'package:schedule_app/utils/app_size_config.dart';

import 'di/di.dart';
import 'presentation/cubit/schedule_cubit.dart';

void main() {
  get_it.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SC().init(constraints, orientation);
            return BlocProvider.value(
              value: getItInstance<ScheduleCubit>(),
              child: MaterialApp(
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child!,
                  );
                },
                debugShowCheckedModeBanner: false,
                title: 'Schedule App',
                home: const LandingScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
