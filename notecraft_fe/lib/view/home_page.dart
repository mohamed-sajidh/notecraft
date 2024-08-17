import 'package:flutter/material.dart';
import 'package:notecraft_fe/utils/app_colors.dart';
import 'package:notecraft_fe/view/widgets/notes_viewer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Notes"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return const NotesViewer();
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 2,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.violetColor,
        onPressed: () {
          print("button pressed");
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
