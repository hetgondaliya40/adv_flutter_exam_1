import 'package:adv_flutter_exam_1/models/crypto_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../news_controller/crypto_controller.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    CryptocurrencyModel allcrypto =
        ModalRoute.of(context)!.settings.arguments as CryptocurrencyModel;

    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("${allcrypto.name}"),
        actions: [
          IconButton(
            icon: Icon(
              favoritesProvider.isFavorite(allcrypto)
                  ? Icons.star
                  : Icons.star_border,
            ),
            onPressed: () {
              if (favoritesProvider.isFavorite(allcrypto)) {
                favoritesProvider.removeFavorite(allcrypto);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                          Text('${allcrypto.name} removed from favorites.')),
                );
              } else {
                favoritesProvider.addFavorite(allcrypto);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('${allcrypto.name} added to favorites.')),
                );
              }
            },
          ),
        ],
      ),
      body: Align(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(allcrypto.image),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    "Market Cap Rank: ${allcrypto.marketCapRank}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Name : ${allcrypto.name}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "current Price: ${allcrypto.currentPrice}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Market Cap Change Percentage: ${allcrypto.marketCapChangePercentage24H.toString().split(".")[0]}%",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Circulating Supply: ${allcrypto.circulatingSupply.toString().split(".")[0]}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
