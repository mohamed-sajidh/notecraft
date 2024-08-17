import 'package:flutter/material.dart';
import 'package:notecraft_fe/controller/home_controller.dart';
import 'package:notecraft_fe/utils/app_colors.dart';
import 'package:notecraft_fe/view/widgets/success_snackbar.dart';
import 'package:provider/provider.dart';

final anFormKey = GlobalKey<FormState>();
final TextEditingController _titleController = TextEditingController();
final TextEditingController _contentController = TextEditingController();

void addNote(BuildContext context) {
  var screeenSize = MediaQuery.of(context).size;
  var width = screeenSize.width;
  var height = screeenSize.height;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      final homeNotifier = Provider.of<HomeNotifier>(context);
      return AlertDialog(
        title: const Text('Add Note'),
        actions: <Widget>[
          Form(
            key: anFormKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TextFormField(
                    controller: _titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0x40D9D9D9),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 36, 77, 113),
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
                    controller: _contentController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0x40D9D9D9),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 36, 77, 113),
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
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: height * 0.055,
                  width: width * 0.20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppColors.boxBorderColor,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: AppColors.black,
                        // fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              InkWell(
                onTap: () {
                  if (anFormKey.currentState!.validate()) {
                    homeNotifier.addNote(
                      _titleController.text,
                      _contentController.text,
                    );
                    Navigator.pop(context);
                    showSnackBar(context);

                //     Flushbar(
                //   title:  "Hey Ninja",
                //   message:  "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                //   duration:  Duration(seconds: 3),              
                // )..show(context);

                  }
                },
                child: Container(
                  height: height * 0.055,
                  width: width * 0.20,
                  decoration: BoxDecoration(
                    color: AppColors.violetColor,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppColors.boxBorderColor,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Add",
                      style: TextStyle(
                        color: AppColors.white,
                        // fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
