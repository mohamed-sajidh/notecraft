import 'package:flutter/material.dart';
import 'package:notecraft_fe/controller/home_controller.dart';
import 'package:notecraft_fe/utils/app_colors.dart';
import 'package:provider/provider.dart';

class SingleNoteViewer extends StatelessWidget {
  const SingleNoteViewer({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeNotifier>(context);
    var screeenSize = MediaQuery.of(context).size;
    var width = screeenSize.width;
    var height = screeenSize.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 243, 220, 220),
        width: width * width,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 15.0,
            right: 8.0,
            bottom: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  constraints: const BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "${homeNotifier.notes[index].date} ",
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        softWrap: true,
                      ),
                      Text(
                        "${homeNotifier.notes[index].month}, ",
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        softWrap: true,
                      ),
                      Text(
                        "${homeNotifier.notes[index].year}",
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        softWrap: true,
                      ),
                    ],
                  )),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 250,
                ),
                child: Text(
                  homeNotifier.notes[index].title,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  softWrap: true,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 350,
                ),
                child: Text(
                  homeNotifier.notes[index].content,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
