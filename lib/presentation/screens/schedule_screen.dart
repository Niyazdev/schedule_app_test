import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_app/di/di.dart';
import 'package:schedule_app/model/schedule_model.dart';
import 'package:schedule_app/presentation/cubit/schedule_cubit.dart';
import 'package:schedule_app/utils/app_size_config.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Screen'),
      ),
      body: BlocProvider.value(
        value: getItInstance<ScheduleCubit>(),
        child: _body(context),
      ),
    );
  }

  Widget _body(context) {
    ScheduleCubit cubit2 = getItInstance<ScheduleCubit>();
    return Column(
      children: [
        ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: 2 * SC.w!,
            vertical: 2 * SC.h!,
          ),
          shrinkWrap: true,
          itemCount: cubit2.schedule.length,
          itemBuilder: (_, index) {
            return BlocBuilder<ScheduleCubit, ScheduleState>(
              bloc: cubit2,
              builder: (_, state) {
                return Row(
                  children: [
                    Checkbox(
                      value: cubit2.schedule[index].enable,
                      shape: CircleBorder(
                        side: BorderSide(
                          color: cubit2.schedule[index].enable
                              ? Colors.green
                              : Colors.transparent,
                        ),
                      ),
                      activeColor: Colors.green,
                      onChanged: (val) {
                        ScheduleModel model = cubit2.schedule[index];
                        model.enable = val!;
                        cubit2.updateSchedule(index, model);
                      },
                    ),
                    Text(
                      cubit2.schedule[index].day.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 2 * SC.w!,
                    ),
                    cubit2.schedule[index].enable
                        ? Expanded(
                            child: Row(
                              children: List.generate(3, (i) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 2 * SC.w!),
                                  child: _slotsItem(
                                    context,
                                    cubit2.schedule[index].schedule
                                        .keyBasedOnIndex(i),
                                    cubit2.schedule[index].schedule
                                        .valueBasedOnIndex(i),
                                    onTap: () {
                                      ScheduleModel model =
                                          cubit2.schedule[index];
                                      model.schedule.changeValueByIndex(
                                          i,
                                          !cubit2.schedule[index].schedule
                                              .valueBasedOnIndex(i));
                                      cubit2.updateSchedule(index, model);
                                    },
                                  ),
                                );
                              }),
                            ),
                          )
                        : const Text(
                            'Unavailable',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                  ],
                );
              },
            );
          },
          separatorBuilder: (_, index) => Divider(
            height: 2 * SC.h!,
            color: Colors.blueGrey,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
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
          child: Text(
            'Save',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                ),
          ),
        )
      ],
    );
  }
}

Widget _slotsItem(context, String key, bool value, {required Function onTap}) {
  return InkWell(
    onTap: () => onTap(),
    child: Container(
      padding: EdgeInsets.all(
        2 * SC.w!,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          2 * SC.w!,
        ),
        border: Border.all(
          color: value ? Colors.indigo : Colors.grey,
        ),
      ),
      child: Text(
        key.toUpperCase(),
        style: Theme.of(context).textTheme.button!.copyWith(
            color: value ? Colors.indigo : Colors.grey, fontSize: 1.5 * SC.h!),
      ),
    ),
  );
}
