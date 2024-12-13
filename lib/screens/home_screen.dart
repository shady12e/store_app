import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:store_app_2/constens.dart';
import 'package:store_app_2/customs/custom_card.dart';
import 'package:store_app_2/model/prodect_model.dart';
import 'package:store_app_2/screens/card_screen.dart';
import 'package:store_app_2/service/all_prodect_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KbackgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.card_travel,
              color: KPriymryColor,
            ),
          )
        ],
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: KbackgroundColor,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'SHADY',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: Kprimaryfont,
              ),
            ),
            Text(
              ' STORE',
              style: TextStyle(
                color: KPriymryColor,
                fontSize: 20,
                fontFamily: Kprimaryfont,
              ),
            )
          ],
        ),
      ),
      body: FutureBuilder<List<ProdectModel>>(
        future: AllProdectService().getAllProdect(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProdectModel> prodects = snapshot.data!;
            return GridView.custom(
              gridDelegate: SliverWovenGridDelegate.count(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 2,
                pattern: [
                  const WovenGridTile(1),
                  const WovenGridTile(
                    5 / 7,
                    crossAxisRatio: 0.9,
                    alignment: AlignmentDirectional.centerEnd,
                  )
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: 10,
                (context, index) => CustomCard(
                  prodectModel: prodects[index],
                  index: index,
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
