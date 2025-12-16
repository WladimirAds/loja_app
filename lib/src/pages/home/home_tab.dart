import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';

import 'package:loja_app/src/config/custom_colors.dart';
import 'package:loja_app/src/pages/commom_widgets/app_name_widget.dart';
import 'package:loja_app/src/pages/commom_widgets/custom_shimmer.dart';
import 'package:loja_app/src/pages/home/components/category_tile.dart';
// ignore: library_prefixes
import 'package:loja_app/src/config/app_data.dart' as appData;
import 'package:loja_app/src/pages/home/components/item_tile.dart';
import 'package:loja_app/src/services/utils_services.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Início';
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();

  late Function(GlobalKey<State<StatefulWidget>>) runAddToCartAnimation;

  void itemSelectedCartAnimatios(GlobalKey gkImage) {
    runAddToCartAnimation(gkImage);
  }

  final UtilsServices utilsServices = UtilsServices();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppNameWidget(),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: CustomColors.customContrastColor,
                label: const Text(
                  '2',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: AddToCartIcon(
                  badgeOptions: BadgeOptions(active: false),
                  key: cartKey,
                  icon: Icon(Icons.shopping_cart, color: Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),

      body: AddToCartAnimation(
        cartKey: cartKey,
        height: 30,
        width: 30,
        opacity: 0.85,
        dragAnimation: DragToCartAnimationOptions(rotation: true),
        jumpAnimation: JumpAnimationOptions(),
        createAddToCartAnimation: (runAddToCartAnimation) {
          this.runAddToCartAnimation = runAddToCartAnimation;
        },

        child: Column(
          children: [
            // Campo de pesquisa
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: 'Pesquisar...',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade400,
                    size: 21,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),

            // Categorias
            Container(
              padding: const EdgeInsets.only(left: 25, right: 10),
              height: 40,
              child:
                  !isLoading
                      ? ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return CategoryTile(
                            onPressed: () {
                              setState(() {
                                selectedCategory = appData.categorias[index];
                              });
                            },
                            category: appData.categorias[index],
                            isSelected:
                                appData.categorias[index] == selectedCategory,
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(width: 10),

                        itemCount: appData.categorias.length,
                      )
                      : ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          10,
                          (index) => Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 10),
                            child: CustomShimmer(
                              height: 22,
                              width: 80,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
            ),
            SizedBox(height: 10),
            // Grid de produtos
            Expanded(
              child:
                  !isLoading
                      ? GridView.builder(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 9 / 11.5,
                            ),
                        itemCount: appData.items.length,
                        itemBuilder: (_, index) {
                          return ItemTile(
                            item: appData.items[index],
                            cartAnimationMethod: itemSelectedCartAnimatios,
                          );
                        },
                      )
                      : GridView.count(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 11.5,
                        children: List.generate(
                          10,
                          (index) => CustomShimmer(
                            height: double.infinity,
                            width: double.infinity,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
