import 'package:flutter/material.dart';
import 'package:notecraft_fe/controller/home_controller.dart';
import 'package:notecraft_fe/utils/app_colors.dart';
import 'package:notecraft_fe/view/widgets/add_notes.dart';
import 'package:notecraft_fe/view/widgets/notes_viewer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Notes"),
        ),
      ),
      body: Consumer<HomeNotifier>(builder: (context, homeNotifier, child) {
        if (homeNotifier.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (homeNotifier.notes.isEmpty) {
          return const Center(child: Text('No products available.'));
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return NotesViewer(index: index);
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: homeNotifier.notes.length,
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.violetColor,
        onPressed: () {
          addNote(context);
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
