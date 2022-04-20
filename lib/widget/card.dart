import 'package:flutter/material.dart';
import 'package:cutaway/screen/cutaway_detail.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final String surname;
  final int id;
  const CardWidget(
      {Key? key, required this.name, required this.surname, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      child: Card(
        child: InkWell(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    surname,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

// Page Route

          onTap: () {
            Navigator.of(context).pushNamed(
              CutawayDetailScreen.routeName,
              arguments: id,
            );
          },
        ),
      ),
    );
  }
}
