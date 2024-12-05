import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/crypto_modal.dart';
import '../../../news_controller/crypto_controller.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: favoritesProvider.favorites.isEmpty
          ? const Center(
              child: Text(
                "No favorites yet!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            )
          : ListView.builder(
              itemCount: favoritesProvider.favorites.length,
              itemBuilder: (context, index) {
                CryptocurrencyModel crypto = favoritesProvider.favorites[index];
                return ListTile(
                  leading: Image.network(crypto.image, height: 40, width: 40),
                  title: Text(crypto.name),
                  subtitle: Text("Current Price: \$${crypto.currentPrice}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      favoritesProvider.removeFavorite(crypto);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('${crypto.name} removed from favorites.')),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
