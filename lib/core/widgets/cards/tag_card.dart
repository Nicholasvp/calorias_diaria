import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagCard extends StatelessWidget {
  const TagCard({super.key, required this.tag});
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        tag,
        style: Get.textTheme.labelSmall!.copyWith(color: Colors.white),
      ),
    );
  }
}
