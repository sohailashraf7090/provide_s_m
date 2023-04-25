import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class SelectedFavourite extends StatefulWidget {
  const SelectedFavourite({super.key});

  @override
  State<SelectedFavourite> createState() => _SelectedFavouriteState();
}

class _SelectedFavouriteState extends State<SelectedFavourite> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
    print("build");
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.favorite)),
          const SizedBox(
            width: 10,
          )
        ],
        title: const Center(child: Text("My favourites")),
      ),
      body: ListView.builder(
        itemCount: favouriteProvider.selecteditem.length,
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
