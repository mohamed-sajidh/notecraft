import 'package:flutter/material.dart';
import 'package:notecraft_fe/utils/app_colors.dart';

class SingleNoteViewer extends StatelessWidget {
  const SingleNoteViewer({super.key});

  @override
  Widget build(BuildContext context) {
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
                // color: Colors.red,
                child: const Text(
                  "17 AUG, 2024",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  softWrap: true,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 250,
                ),
                // color: Colors.red,
                child: const Text(
                  "Test Note",
                  style: TextStyle(
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
                // color: Colors.red,
                child: const Text(
                  "This note section is for testing the height and width of the container",
                  style: TextStyle(
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
