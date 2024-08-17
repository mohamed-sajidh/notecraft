import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:notecraft_fe/model/note_model.dart';

class HomeNotifier with ChangeNotifier {
  bool loading = false;
  List<NoteModel> notes = [];

  HomeNotifier() {
    init();
  }

  void init() {
    getNotes();
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> getNotes() async {
    try {
      setLoading(true);
      final response =
          await Dio().get("http://localhost:3000/api/get-all-notes");

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;

        List<dynamic> notesJson = responseData['notes'];

        notes = List<NoteModel>.from(notesJson.map((noteJson) =>
            NoteModel.fromJson(noteJson as Map<String, dynamic>)));

        notifyListeners();
      } else {
        print('Failed to load notes: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      setLoading(false);
    }
  }

  Future<void> addNote(title, content) async {
    try {
      final response = await Dio().post(
        "http://localhost:3000/api/add-notes",
        data: {
          'title': title,
          'content': content,
        },
      );

      if (response.statusCode == 200) {
        print(response.data);
        getNotes();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> editNote(title, content, id) async {
    try {
      final response =
          await Dio().post("http://localhost:3000/api/update-note/$id", data: {
        'title': title,
        'content': content,
      });
      if (response.statusCode == 200) {
        print(response.data);
        getNotes();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteNote(id) async {
    try {
      final response = await Dio().post("http://localhost:3000/api/delete-note/$id");
      if (response.statusCode == 200) {
        print(response.data);
        getNotes();
      }
    } catch (e) {
      print(e);
    }
  }
}
