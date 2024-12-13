import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:store_app_2/constens.dart';
import 'package:store_app_2/customs/custom_card.dart';
import 'package:store_app_2/model/prodect_model.dart';
import 'package:store_app_2/service/category_service.dart';

// ignore: must_be_immutable
class categorysScreenView extends StatelessWidget {
  categorysScreenView({super.key, required this.categoryNmae});
  String categoryNmae;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KbackgroundColor,
      appBar: AppBar(
        backgroundColor: KbackgroundColor,
        title: Text(categoryNmae),
      ),
      body: FutureBuilder<List<ProdectModel>>(
        future: CategoryService().GetCategory(CategoryName: categoryNmae),
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
                childCount: prodects.length,
                (context, index) => CustomCard(
                  prodectModel: prodects[index],
                  index: index,
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
