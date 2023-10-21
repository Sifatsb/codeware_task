import 'package:codeware_task/home/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function()? onTap;

  const CustomSearchBar({
    super.key,
    required this.textEditingController,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: 'Enter Search ID',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.0),
                ),
                suffixIcon: Icon(Icons.search)
              ),
            ),
          ),
          const SizedBox(width: 10,),
          CustomButton(title: 'Search', onTap: onTap,),
        ],
      ),
    );
  }
}
