import 'package:bloodque/core/constants/hive_constants.dart';
import 'package:bloodque/core/shared/data/data_sources/local/database_service.dart';
import 'package:bloodque/core/shared/data/models/measure_model.dart';
import 'package:bloodque/core/shared/data/repository/measures_repository_impl.dart';
import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';
import 'package:bloodque/core/shared/domain/repository/measures_repository.dart';
import 'package:bloodque/core/shared/presentation/bloc/measures_bloc.dart';
import 'package:bloodque/features/indicators_record/domain/usecases/save_measure/save_measure_usecase.dart';
import 'package:bloodque/features/indicators_record/presentation/bloc/change_measure_bloc/change_measure_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

GetIt getIt = GetIt.instance;
Future<void> initializeDependencies() async {
  await _initializeHive();
  _registerAdapters();

  var box = await _initializeBox();

  getIt
    // Hive
    ..registerSingleton<Box<dynamic>>(box)

    // Service
    ..registerSingleton<DatabaseService>(DatabaseServiceImpl(getIt()))

    // Repository
    ..registerSingleton<MeasuresRepository>(MeasuresRepositoryImpl(getIt()))

    // Use Cases
    ..registerSingleton<SaveMeasureUseCase>(SaveMeasureUseCase(getIt()))

    // Bloc
    ..registerFactory<MeasuresBloc>(() => MeasuresBloc(getIt()))
    ..registerFactory<ChangeMeasureBloc>(() => ChangeMeasureBloc());
}

Future<void> _initializeHive() async {
  await Hive.initFlutter();
  await Hive.openBox(hiveMeasureBox);
}

Future<Box<dynamic>> _initializeBox() async => await Hive.openBox(hiveMeasureBox);

void _registerAdapters(){
  Hive.registerAdapter(MeasureModelAdapter());
  Hive.registerAdapter(MeasureEntityAdapter());
}
