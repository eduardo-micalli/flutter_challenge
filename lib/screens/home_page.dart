import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../data/repository_data.dart';
import '../widgets/list_widget.dart';
import 'favorites_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPagesBackgroundColor,
        title: Text(title),
        flexibleSpace: Container(
          padding: const EdgeInsets.only(right: 20),
          child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              Container(
                padding: EdgeInsets.only(top: 35),
                alignment: AlignmentDirectional.topEnd,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${Provider.of<RepositoryData>(context).savedRepositoriesCount}',
                  style: const TextStyle(color: kButtonCardColor),
                ),
              ),
              IconButton(
                padding: EdgeInsets.only(top: 35),
                icon: const Icon(Icons.bookmark),
                color: kButtonCardColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavoritesPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: const Center(
        child: MyListWidget(),
      ),
    );
  }
}
