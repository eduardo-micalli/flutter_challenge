import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/repository_data.dart';
import 'card_widget.dart';

class MyListWidget extends StatefulWidget {
  const MyListWidget({super.key});

  @override
  State<MyListWidget> createState() => _MyListWidgetState();
}

class _MyListWidgetState extends State<MyListWidget> {
  @override
  void initState() {
    super.initState();
    final dataProvider = Provider.of<RepositoryData>(context, listen: false);
    dataProvider.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RepositoryData>(builder: (context, value, child) {
      if (value.repositories.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.builder(
          itemCount: value.repositories.length,
          itemBuilder: (context, index) {
            final item = value.repositories[index];
            return Container(
                margin: const EdgeInsets.only(
                  top: 40,
                ),
                child: CardWidget(item: item));
          },
        );
      }
    });
  }
}
