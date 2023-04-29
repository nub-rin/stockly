import 'package:flutter/material.dart';

import '../utils/user_data.dart';

class FavList extends StatefulWidget {
  final List<dynamic> favList;

  const FavList({
    super.key,
    required this.favList,
  });

  @override
  State<FavList> createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(color: Colors.grey[500]);
      },
      itemCount: widget.favList.length,
      itemBuilder: (context, index) {

    return ListTile(
      contentPadding: const EdgeInsets.all(10.0),
      title:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.favList[index],
        style: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
        Text('Company Name',
        style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w300)),
      ],
    ),
    trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('asasas',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
              const SizedBox(width: 10),
              Container(
                width: 75,
                height: MediaQuery.of(context).size.height * 0.021,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text(
                    'asasas',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  UserData().removeFavorite(widget.favList[index]);
                  setState(() {
                    widget.favList.removeAt(index);
                  });
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.grey,
                  ),
              ),
            ],
          ),
    );
      },
    );
  }
}