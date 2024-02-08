import 'package:bloodque/config/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => AppBar(
    backgroundColor: mainColor,
    foregroundColor: Colors.white,
    title: Text(title),
  );
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
