import 'package:get_it/get_it.dart';
import 'package:schedule_app/presentation/cubit/schedule_cubit.dart';

final getItInstance = GetIt.I;

Future init() async {
  _blocCubit();
}

void _blocCubit() {
  getItInstance.registerSingleton<ScheduleCubit>(
    ScheduleCubit(),
  );
}
