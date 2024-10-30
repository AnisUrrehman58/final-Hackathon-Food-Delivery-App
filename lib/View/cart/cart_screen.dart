
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../Provider/provider_state.dart';
import '../../Utils/Constant/images.dart';
import '../BottomNavigation/bottom_navigation_menu.dart';
import 'cartListViewBuilderWidgets/list_view_cart_widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Colors.transparent, // Ensure transparent background
      extendBody: true, // Extends body under the bottom navigation
      // backgroundColor: AColor.loginContainer,
      /// Order Screen
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height ,
              width: width,
              decoration: BoxDecoration(
                /// BackGround Image
                image: DecorationImage(image: AssetImage(AImages.backGroundImages),fit: BoxFit.cover,repeat: ImageRepeat.repeat),
              ),
              child:  Padding(
                padding:  EdgeInsets.only(top: height * 0.05,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                // Get.to(() => const BottomNavigationMenu());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                        const BottomNavigationMenu()));
                              },
                              icon: const Icon(Icons.arrow_back_ios,color: Colors.white)),
                          const Text('My Cart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white)),
                          Consumer<FavouriteItem>(
                            builder: (context, value, child) => value
                                .selectedFavourites.isEmpty
                                ? IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.shopping_bag_outlined,size: 30,color: Colors.white,))
                                : Stack(
                              clipBehavior: Clip.none,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.to(() => const CartScreen());
                                  },
                                  icon: const Icon(Icons.shopping_bag_outlined,
                                      size: 30),
                                ),
                                Positioned(
                                  top: 1,
                                  right: 1,
                                  child: CircleAvatar(
                                    radius: 9,
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      value.selectedFavourites.length
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    /// order Detail card
                    SizedBox(
                        height: height * 0.8,
                        child: const CartListViewBuilderWidgets())
                    // Expanded(
                    //   child: ListView.builder(
                    //     itemCount: 3,
                    //     itemBuilder: (context, index) {
                    //     return  Row(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Container(
                    //           margin: EdgeInsets.only(bottom: height * 0.03),
                    //           height: height * 0.16,
                    //           width: width * 0.42,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(12),
                    //               image: DecorationImage(image: AssetImage(AImages.salid),fit: BoxFit.cover)
                    //           ),
                    //         ),
                    //         Padding(
                    //           padding:  EdgeInsets.only(top: height * 0.01),
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               const TitleText(title: '\$52.00\nChicken Veggi Salad'),
                    //               const LightText(text: 'With cheese sauce'),
                    //               SizedBox(height: height * 0.01),
                    //               Row(
                    //                 children: [
                    //                   Container(
                    //                       height: height *0.04,
                    //                       width:  width * 0.25,
                    //                       decoration: BoxDecoration(
                    //                           color:Colors.white,
                    //                           borderRadius: BorderRadius.circular(07),
                    //                           border: Border.all(color: Colors.white.withOpacity(0.5))
                    //                       ),
                    //                       child:  Stack(
                    //                         clipBehavior: Clip.none,
                    //                         children: [
                    //                           Positioned(
                    //                               bottom: 0,
                    //                               left: -10,
                    //                               child: TextButton(onPressed: (){}, child: const Icon(Icons.minimize,))),
                    //                           const SizedBox(width: 10),
                    //                           const Center(child: Text('01',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600))),
                    //                           Positioned(
                    //                               top: -08,
                    //                               right: -10,
                    //                               child: TextButton(onPressed: (){}, child: const Icon(Icons.add))),
                    //
                    //
                    //                         ],
                    //                       )
                    //                   ),
                    //                   InkWell(
                    //                     onTap: (){},
                    //                     child: Container(
                    //                       margin: EdgeInsets.only(left: width * 0.15),
                    //                       height: 30,
                    //                       width: 30,
                    //                       decoration: BoxDecoration(
                    //                         color: Colors.white,
                    //                         borderRadius: BorderRadius.circular(08),
                    //                       ),
                    //                       child:const Icon( Icons.delete),
                    //                     ),
                    //                   )
                    //                 ],
                    //               ),
                    //
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     );
                    //
                    //   },),
                    // )

                  ],
                ),
              ),
            ),
          ],
        ),
      ),


    );

  }
}



