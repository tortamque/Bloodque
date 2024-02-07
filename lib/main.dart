import 'package:bloodque/config/themes/app_theme.dart';
import 'package:bloodque/config/themes/colors.dart';
import 'package:bloodque/core/dependency_injection.dart';
import 'package:bloodque/core/shared/presentation/bloc/measures_bloc.dart';
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
  Widget build(BuildContext context) => BlocProvider<MeasuresBloc>(
    create: (context) => getIt(),
    child: MaterialApp(
        theme: theme(mainColor),
        home: MainViewPage(),
      ),
  );
}
