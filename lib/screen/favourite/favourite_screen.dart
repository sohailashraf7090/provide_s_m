import 'package:flutter/material.dart';
import 'package:provide_s_m/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

import 'myfavourites.dart';

class FavouritemScreen extends StatefulWidget {
  const FavouritemScreen({super.key});

  @override
  State<FavouritemScreen> createState() => _FavouritemScreenState();
}

class _FavouritemScreenState extends State<FavouritemScreen> {
  List<int> selecteditem = [];
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectedFavourite()));
              },
              child: const Icon(Icons.favorite)),
          const SizedBox(
            width: 10,
          )
        ],
        title: const Center(child: Text("My favourite App ")),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Consumer<FavouriteItemProvider>(
              builder: ((context, value, child) {
            return ListTile(
              onTap: (() {
                if (value.selecteditem.contains(index)) {
                  value.removeitem(index);
                } else {
                  value.additem(index);
                }
              }),
              title: Text("item$index"),
              trailing: Icon(value.selecteditem.contains(index)
                  ? Icons.favorite
                  : Icons.favorite_border_outlined),
            );
          }));
        },
      ),
    );
  }
}
