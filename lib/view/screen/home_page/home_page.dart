import 'package:flutter/material.dart';

import '../../../helper/api_helper.dart';
import '../../../models/crypto_modal.dart';
import '../../../routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.favoritePage);
            },
            icon: Icon(Icons.star_border),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiHelper.apiHelper.cryptoApiHelper(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Center(
              child: Text("ERROR : ${snapShot.error}"),
            );
          } else if (snapShot.hasData) {
            List<CryptocurrencyModel> cryptoData = snapShot.data!;
            return ListView.builder(
              itemCount: cryptoData.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.detailPage,
                          arguments: cryptoData[index]);
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(cryptoData[index].image),
                    ),
                  ),
                  title: Text(cryptoData[index].name),
                  subtitle: Text(cryptoData[index].symbol),
                  children: [
                    ListTile(
                      title: Text("Price : ${cryptoData[index].currentPrice}"),
                    ),
                    ListTile(
                      title:
                          Text("Market Cap : ${cryptoData[index].marketCap}"),
                    ),
                    ListTile(
                      title: Text(
                          "Market Cap Rank : ${cryptoData[index].marketCapRank}"),
                    ),
                    ListTile(
                      title: Text(
                          "Total Volume : ${cryptoData[index].totalVolume}"),
                    )
                  ],
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
