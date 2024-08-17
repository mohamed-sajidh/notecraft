import 'package:flutter/material.dart';
import 'package:notecraft_fe/controller/home_controller.dart';
import 'package:notecraft_fe/utils/app_colors.dart';
import 'package:provider/provider.dart';

final anFormKey = GlobalKey<FormState>();

void editNote(BuildContext context, index) {
  var screeenSize = MediaQuery.of(context).size;
  var width = screeenSize.width;
  var height = screeenSize.height;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      final homeNotifier = Provider.of<HomeNotifier>(context);
      final TextEditingController titleController =
          TextEditingController(text: homeNotifier.notes[index].title);
      final TextEditingController contentController =
          TextEditingController(text: homeNotifier.notes[index].content);
      return AlertDialog(
        title: const Text('edit Note'),
        actions: <Widget>[
          Form(
            key: anFormKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TextFormField(
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: AppColors.textFieldFillColor,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.violetColor,
                          width: 0.5,
                        ),
                      ),
                      labelText: 'Enter the Title',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TextFormField(
                    controller: contentController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: AppColors.textFieldFillColor,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.violetColor,
                          width: 0.5,
                        ),
                      ),
                      labelText: 'Enter the Content',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.030,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              TextButton(
                onPressed: () {
                  homeNotifier.editNote(
                    titleController.text,
                    contentController.text,
                    homeNotifier.notes[index].id,
                  );
                  Navigator.pop(context);
                },
                child: const Text('Ok'),
              ),
            ],
          ),
        ],
      );
    },
  );
}
