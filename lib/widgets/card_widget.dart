import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../constants.dart';
import '../data/repository_data.dart';
import '../models/repository.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.item,
  });

  final Repository item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: kCardColor,
      ),
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
      margin: const EdgeInsets.fromLTRB(40, 0, 40, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  '${item.stars}',
                  style: kStarsCountTextStyle,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Icon(Icons.star, color: kStarsIconColor),
              )
            ],
          ),
          Text(
            item.name!,
            style: kCardTitleStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            item.description ?? '-',
            textAlign: TextAlign.center,
            style: kCardDetailsStyle,
          ),
          Text(
            'Created at ${DateFormat('MM/dd/yyyy').format(item.createdAt!)}',
            style: kCardDetailsStyle,
          ),
          Text(
            item.language ?? '-',
            style: kCardDetailsStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              if (!item.isSaved) {
                Provider.of<RepositoryData>(context, listen: false)
                    .updateRepository(item);
              }
            },
            child: Container(
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: (!item.isSaved)
                    ? kButtonCardColor
                    : kButtonCardColorDisabled,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                'Save Repo',
                style: TextStyle(
                    color: (!item.isSaved)
                        ? kButtonCardTextColor
                        : kButtonCardTextColorDisabled,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
