import 'package:flutter/material.dart';
import 'package:flutter_challenge/data/repository_data.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          backgroundColor: kPagesBackgroundColor,
        ),
        body: Consumer<RepositoryData>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final repository = value.savedRepositories[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 4,
                                child: Text(
                                  repository.name!,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 221, 222, 232),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                child: Container(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: const Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 221, 40, 40),
                                    size: 18,
                                  ),
                                ),
                                onTap: () {
                                  Provider.of<RepositoryData>(context,
                                          listen: false)
                                      .updateRepository(repository);
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Divider(
                            color: Color.fromARGB(158, 64, 67, 78),
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: value.savedRepositoriesCount,
              ),
            );
          },
        ));
  }
}
