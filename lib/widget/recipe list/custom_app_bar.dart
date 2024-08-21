import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Color(0xff4A7C74),
        ),
      ),
      leading: const Icon(
        Icons.filter_list,
        color: Color(0xff4A7C74),
        size: 32,
      ),
      actions: const [
        Icon(
          Icons.search,
          color: Color(0xff4A7C74),
          size: 32,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
