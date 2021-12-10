import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_health/common/style.dart';
import 'package:yum_health/data/temporary_data.dart';
import 'package:yum_health/provider/change_favorite_provider.dart';
import 'package:yum_health/widget/favorite_button.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.resep}) : super(key: key);
  static const routeName = '/detail_page';

  final Resep? resep;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<ChangeFavoriteProvider>(
      create: (_) => ChangeFavoriteProvider(id: resep!.id, context: context),
      child: Scaffold(
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width,
                        height: size.width * (2 / 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(resep!.imageAsset),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        left: size.width * (1 / 40),
                        top: size.width * (1 / 40),
                        child: CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.8),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(resep!.title, style: myTextTheme.headline1),
                      FavoriteButton(
                        data: resep!,
                      ),
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, left: 15, right: 15),
                      child: Text(resep!.label, style: myTextTheme.headline6),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Ingredients',
                    style: myTextTheme.headline5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(resep!.ingredients,
                          style: myTextTheme.subtitle1),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'How to make',
                    style: myTextTheme.headline5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(resep!.steps, style: myTextTheme.subtitle1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
