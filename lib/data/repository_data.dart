import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/repository.dart';

class RepositoryData extends ChangeNotifier {
  List<Repository> _repositories = [];
  final dio = Dio();

  Future<List<Repository>> getData() async {
    try {
      final response =
          await dio.get('https://api.github.com/users/flutter/repos');
      final data = List<Repository>.from(response.data.map((json) => Repository(
          id: json['id'],
          name: json['name'],
          description: json['description'],
          createdAt: DateTime.parse(json['created_at']),
          language: json['language'],
          stars: json['stargazers_count'])));
      _repositories = data;
      notifyListeners();
    } catch (e) {
      print(e);
      return [];
    }
    return _repositories;
  }

  UnmodifiableListView<Repository> get repositories {
    return UnmodifiableListView(_repositories);
  }

  UnmodifiableListView<Repository> get savedRepositories {
    return UnmodifiableListView(
        _repositories.where((element) => element.isSaved));
  }

  int get savedRepositoriesCount {
    return _repositories.where((element) => element.isSaved).length;
  }

  void updateRepository(Repository repository) {
    repository.toggleSaved();
    notifyListeners();
  }
}
