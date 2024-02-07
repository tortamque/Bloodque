import 'package:bloodque/core/constants/hive_constants.dart';
import 'package:bloodque/core/shared/data/models/measure_model.dart';
import 'package:bloodque/core/shared/data/repository/measures_repository_impl.dart';
import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';
import 'package:bloodque/core/shared/domain/repository/measures_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

GetIt getIt = GetIt.instance;
Future<void> initializeDependencies() async {
  await _initializeHive();
  _registerAdapters();

  var box = await _initializeBox();

  getIt
    ..registerSingleton<Box<dynamic>>(box)
    ..registerSingleton<MeasuresRepository>(MeasuresRepositoryImpl());
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
