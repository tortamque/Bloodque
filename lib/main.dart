import 'package:bloodque/config/themes/app_theme.dart';
import 'package:bloodque/config/themes/colors.dart';
import 'package:bloodque/core/constants/navigator_constants.dart';
import 'package:bloodque/core/dependency_injection.dart';
import 'package:bloodque/features/indicators_record/presentation/bloc/change_measure_bloc/change_measure_bloc.dart';
import 'package:bloodque/features/indicators_record/presentation/bloc/save_measure_bloc/save_measures_bloc.dart';
import 'package:bloodque/features/indicators_record/presentation/pages/indicators_record_page.dart';
import 'package:bloodque/features/view/presentation/bloc/get_all_measures_bloc/get_all_measures_bloc.dart';
import 'package:bloodque/features/view/presentation/bloc/get_three_measures_bloc/get_three_measures_bloc.dart';
import 'package:bloodque/features/view/presentation/pages/detailed_view_page.dart';
import 'package:bloodque/features/view/presentation/pages/main_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  
  runApp(const BloodqueApp());
}

class BloodqueApp extends StatelessWidget {
  const BloodqueApp({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getIt<GetAllMeasuresBloc>()),
      BlocProvider(create: (context) => getIt<GetThreeMeasuresBloc>()),
      BlocProvider(create: (context) => getIt<SaveMeasuresBloc>()),
      BlocProvider(create: (context) => getIt<ChangeMeasureBloc>()),
    ],
    child: MaterialApp(
      theme: theme(mainColor),
      initialRoute: mainPageConstant,
      routes: {
        mainPageConstant: (context) => const MainViewPage(),
        detailedPageConstant: (context) => const DetailedViewPage(),
        recordPageConstant: (context) => const IndicatorsRecordPage(),
      },
    ),
  );
}
