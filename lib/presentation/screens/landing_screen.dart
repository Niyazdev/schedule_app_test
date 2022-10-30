import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_app/di/di.dart';
import 'package:schedule_app/presentation/cubit/schedule_cubit.dart';
import 'package:schedule_app/presentation/screens/schedule_screen.dart';
import 'package:schedule_app/utils/app_size_config.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScheduleCubit cubit = getItInstance<ScheduleCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            BlocBuilder<ScheduleCubit, ScheduleState>(
              builder: (_, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4 * SC.w!,
                    vertical: 2 * SC.h!,
                  ),
                  child: Text(
                    cubit.displayLandingPageText(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                );
              },
            ),
            SizedBox(
              height: 2 * SC.h!,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScheduleScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 16 * SC.w!,
                  vertical: 2 * SC.h!,
                ),
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    4 * SC.i!,
                  ),
                ),
              ),
              child: BlocBuilder<ScheduleCubit, ScheduleState>(
                builder: (_, state) {
                  return Text(
                    (cubit.displayLandingPageText().isEmpty)
                        ? 'Add Schedule'
                        : 'Edit Schedule',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                        ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
