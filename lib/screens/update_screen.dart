import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app_2/constens.dart';
import 'package:store_app_2/customs/elevated_buttom.dart';
import 'package:store_app_2/customs/text_fild_customs.dart';
import 'package:store_app_2/model/prodect_model.dart';
import 'package:store_app_2/service/update_all_prodect.dart';

class UpdateScreen extends StatefulWidget {
  UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  String? title, dec, image;

  dynamic price, id;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProdectModel prodectModel =
        ModalRoute.of(context)!.settings.arguments as ProdectModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KbackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: KbackgroundColor,
          title: const Text(
            'Update Prodect',
            style: TextStyle(
              fontSize: 30,
              fontFamily: Kprimaryfont,
              color: KPriymryColor,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              CustomtextField(
                labelText: 'ProdectName',
                onchange: (data) {
                  title = data;
                },
              ),
              SizedBox(
                height: 35,
              ),
              CustomtextField(
                labelText: 'Describtion',
                onchange: (data) {
                  dec = data;
                },
              ),
              SizedBox(
                height: 35,
              ),
              CustomtextField(
                labelText: 'price',
                textInputType: TextInputType.number,
                onchange: (data) {
                  price = data; // remberrrrrrrrrrrrrrrrr
                },
              ),
              SizedBox(
                height: 35,
              ),
              CustomtextField(
                labelText: 'Image',
                onchange: (data) {
                  image = data;
                },
              ),
              SizedBox(
                height: 100,
              ),
              CustomElevatedButtoms(
                ontap: () async {
                  isLoading = true;
                  setState(() {});

                  try {
                    await updateProdect(prodectModel);
                    print('sucess');
                  } catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});

                  Navigator.pop(context);
                },
                text: 'Update',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProdect(ProdectModel prodectModel) async {
    await UpdataAllProdect().upDataAllProdect(
      id: prodectModel.id,
      title: title == null ? prodectModel.title : title!,
      price: price == null ? prodectModel.price : price!!,
      description: dec == null ? prodectModel.description : dec!,
      image: image == null ? prodectModel.image : image!,
      category: prodectModel.category,
    );
  }
}
