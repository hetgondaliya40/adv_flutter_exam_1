import 'package:flutter/material.dart';

import '../models/crypto_modal.dart';

class FavoritesProvider with ChangeNotifier {
  final List<CryptocurrencyModel> _favorites = [];

  List<CryptocurrencyModel> get favorites => _favorites;

  void addFavorite(CryptocurrencyModel crypto) {
    if (!_favorites.contains(crypto)) {
      _favorites.add(crypto);
      notifyListeners();
    }
  }

  void removeFavorite(CryptocurrencyModel crypto) {
    _favorites.remove(crypto);
    notifyListeners();
  }

  bool isFavorite(CryptocurrencyModel crypto) {
    return _favorites.contains(crypto);
  }
}
