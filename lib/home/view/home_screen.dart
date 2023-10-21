import 'package:codeware_task/home/controller/home_controller.dart';
import 'package:codeware_task/home/view/widgets/custom_button.dart';
import 'package:codeware_task/home/view/widgets/custom_search_bar.dart';
import 'package:codeware_task/home/view/widgets/display_items.dart';
import 'package:flutter/material.dart';
import '../../dummy_data/input_json_data.dart';
import '../model/android_version_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? title;
  final TextEditingController _searchController = TextEditingController();
  List<AndroidVerison> androidVersionsList = [];

  @override
  void didChangeDependencies() {
    parsingJsonResponse(input1);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DisplayListItem(
            versionList: androidVersionsList,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                title: 'Input 1',
                width: MediaQuery.sizeOf(context).width / 3,
                onTap: () {
                  androidVersionsList.clear();
                  setState(
                    () {
                      parsingJsonResponse(input1);
                    },
                  );
                },
              ),
              CustomButton(
                title: 'Input 2',
                width: MediaQuery.sizeOf(context).width / 3,
                onTap: () {
                  androidVersionsList.clear();
                  setState(
                    () {
                      parsingJsonResponse(input2);
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          CustomSearchBar(
            textEditingController: _searchController,
            onTap: () {
              if (_searchController.text.isNotEmpty) {
                final id = int.parse(_searchController.text);
                title = HomeController()
                        .searchAndroidVersion(id, androidVersionsList) ??
                    '';
                HomeController().showMyDialog(context, _searchController.text,
                    title ?? 'No Data Available');
              }
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  void parsingJsonResponse(List<dynamic> json) {
    for (var data in json) {
      if (data.runtimeType == List<Object>) {
        parsingJsonResponse(data);
      } else if (data.runtimeType == List<Map<String, Object>>) {
        for (var version in data) {
          androidVersionsList.add(
            AndroidVerison(
              id: version['id'],
              title: version['title'],
            ),
          );
        }
      } else {
        final keys = data.keys.toList();
        int endKey = int.parse(keys[keys.length - 1]);

        for (var i = 0; i <= endKey; i++) {
          if (data[i.toString()] != null) {
            androidVersionsList.add(
              AndroidVerison(
                id: data[i.toString()]['id'],
                title: data[i.toString()]['title'],
              ),
            );
          } else {
            androidVersionsList.add(AndroidVerison(id: null, title: null));
          }
        }
      }
    }
  }
}
