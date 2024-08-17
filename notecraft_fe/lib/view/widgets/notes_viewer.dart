import 'package:flutter/material.dart';
import 'package:notecraft_fe/controller/home_controller.dart';
import 'package:notecraft_fe/utils/app_colors.dart';
import 'package:notecraft_fe/view/widgets/delete_popup.dart';
import 'package:notecraft_fe/view/widgets/edit_note.dart';
import 'package:notecraft_fe/view/widgets/single_note_viewer.dart';
import 'package:provider/provider.dart';

class NotesViewer extends StatelessWidget {
  const NotesViewer({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeNotifier>(context);
    var screeenSize = MediaQuery.of(context).size;
    var width = screeenSize.width;
    var height = screeenSize.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppColors.boxBorderColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * 0.18,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
                color: AppColors.violetColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    homeNotifier.notes[index].month,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    softWrap: true,
                  ),
                  Text(
                    homeNotifier.notes[index].date.toString(),
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    softWrap: true,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SingleNoteViewer(
                      index: index,
                    ),
                  ),
                );
              },
              child: SizedBox(
                width: width * 0.45,
                height: height * height,
                child: Center(
                  child: Text(
                    homeNotifier.notes[index].title,
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    softWrap: true,
                  ),
                ),
              ),
            ),
            Container(
              width: width * 0.16,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      editNote(context, index);
                    },
                    child: const Icon(
                      Icons.edit,
                      color: AppColors.blue,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      deleteNote(context, index);
                    },
                    child: const Icon(
                      Icons.delete,
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
