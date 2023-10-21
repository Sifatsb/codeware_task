import 'package:flutter/material.dart';
import '../../model/android_version_model.dart';

class DisplayListItem extends StatelessWidget {
  final List<AndroidVerison> versionList;

  const DisplayListItem({
    super.key,
    required this.versionList,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: versionList
          .map(
            (item) => Container(
              width: 100,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  item.title ?? '',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
