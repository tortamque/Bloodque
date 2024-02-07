import 'package:bloodque/config/themes/colors.dart';
import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';
import 'package:bloodque/core/shared/presentation/bloc/measures_bloc.dart';
import 'package:bloodque/core/shared/presentation/bloc/measures_state.dart';
import 'package:bloodque/features/indicators_record/presentation/bloc/change_measure_bloc/change_measure_bloc.dart';
import 'package:bloodque/features/indicators_record/presentation/bloc/change_measure_bloc/change_measure_state.dart';
import 'package:bloodque/features/indicators_record/presentation/bloc/save_measure_bloc/save_measure_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<MeasuresBloc, MeasuresState>(
    builder: (context, state) => BlocBuilder<ChangeMeasureBloc, ChangeMeasureState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: BlocBuilder<MeasuresBloc, MeasuresState>(
          builder: (context, measuresState) {
            if(measuresState is MeasuresLoading){
              return const CircularProgressIndicator();
            } else{
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {
                    context.read<MeasuresBloc>().add(
                      SaveMeasureEvent(
                        measure: MeasureEntity(
                          systolic: state.systolic,
                          diastolic: state.diastolic,
                          pulse: state.pulse,
                          date: state.date,
                          time: DateTime(
                            state.date.year,
                            state.date.month,
                            state.date.day,
                            state.time.hour,
                            state.time.minute,
                          ),
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color?>(mainColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.5),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 7.5),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    ),
  );
}
