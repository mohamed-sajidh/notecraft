import 'package:flutter/material.dart';
import 'package:notecraft_fe/controller/home_controller.dart';
import 'package:notecraft_fe/utils/app_colors.dart';
import 'package:notecraft_fe/view/widgets/success_snackbar.dart';
import 'package:provider/provider.dart';

final anFormKey = GlobalKey<FormState>();

void deleteNote(BuildContext context, index) {
  var screeenSize = MediaQuery.of(context).size;
  var width = screeenSize.width;
  var height = screeenSize.height;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      final homeNotifier = Provider.of<HomeNotifier>(context);

      return AlertDialog(
        title: const Text(
          'Are you sure you want to delete this item',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
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
                  homeNotifier.deleteNote(
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
