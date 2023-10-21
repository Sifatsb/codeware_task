import 'package:flutter/material.dart';
import '../model/android_version_model.dart';

class HomeController {

  String? searchAndroidVersion(int id, List<AndroidVerison> androidVersionsList) {
    for (var version in androidVersionsList) {
      if (version.id == id) return version.title;
    }
    return 'No Data Available';
  }

   showMyDialog(
    BuildContext context,
    String inputId,
    String title,
  ) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text('ID Number $inputId: $title'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
