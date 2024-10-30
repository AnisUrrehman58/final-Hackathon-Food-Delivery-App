import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../CustomWidgets/icons_widgets.dart';
import '../../CustomWidgets/title_text.dart';
import '../../Provider/provider_state.dart';
import '../../Utils/Constant/colors.dart';
import '../../Utils/Constant/images.dart';
import '../cart/cart_screen.dart';
import '../nodleDetail/nodle_detail_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  bool isSelected = true; // Track selection state

  @override
  Widget build(BuildContext context) {
    int index = 0;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  Scaffold(
      /// Detail Screen
      body: SingleChildScrollView(
        child: Column(
          children: [
          Container(
            height: height * 1.1,
          width: width,
          decoration: BoxDecoration(
            /// BackGround Image
            image: DecorationImage(image: AssetImage(AImages.backGroundImages),fit: BoxFit.cover,repeat: ImageRepeat.repeat),
          ),
         child: Column(
           children: [
             Stack(
               clipBehavior: Clip.none,
               children: [
                 Image.asset(AImages.detailDish),
        
                       Positioned(
                           left: width *0.03,
                           top: height * 0.06,
                           child:  GestureDetector(
                             onTap: (){
                               Navigator.pop(context);
                             },
                               child: const IconWidget(icon: Icons.arrow_back_ios,))),
                        Positioned(
                           right: width *0.17,
                           top: height * 0.06,
                           child:  InkWell(
                               onTap: (){}, child: const IconWidget(icon: Icons.favorite_outline,))),
        
                 Positioned(
                     right: width * 0.02,
                     top: height * 0.05,
                     child: Consumer<FavouriteItem>(
                       builder: (context, value, child) => value
                           .selectedFavourites.isEmpty
                           ? IconButton(
                           onPressed: () {
                             Get.to(() => const CartScreen());
                           },
                           icon: const IconWidget(icon: Icons.shopping_bag_outlined))
                           : Stack(
                         clipBehavior: Clip.none,
                         children: [
                           IconButton(
                             onPressed: () {
                               Get.to(() => const CartScreen());
                             },
                             icon:
                             const IconWidget(icon: Icons.shopping_bag_outlined)),
                           Positioned(
                             top: 1,
                             right: 1,
                             child: CircleAvatar(
                               radius: 9,
                               backgroundColor: Colors.black,
                               child: Text(
                                 value.selectedFavourites.length.toString(),
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

                 ),
        
                 Container(
                   padding: EdgeInsets.only(left: width * 0.04,top: height * 0.02),
                   margin: EdgeInsets.symmetric(horizontal: width * 0.05,vertical: height * 0.38),
                   height: height *0.20,
                   width: width * 80,
                   decoration: BoxDecoration(
                     color: AColor.buttonBackGround.withOpacity(0.6),
                     border: Border.all(color: Colors.white.withOpacity(0.5),width: 0.8),
                     borderRadius: BorderRadius.circular(15),
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Image.asset(AImages.detailLogo,scale: 0.9),
                            SizedBox(width: width * 0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               const TitleText(title: 'Kinka Izakaya'),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   const Text('2972 Westheimer Rd. Santa Ana',style: TextStyle(color: Colors.grey)),
                                   SizedBox(width: width * 0.04),
                                   IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,))
                                 ],
                               ),
                               const SizedBox(height: 05,)
                             ],
                           )
                         ],
                       ),
                        const Row(
                         children: [
                           Expanded(child: Text('Delivery fee',style: TextStyle(color: Colors.grey))),
                           Expanded(child: Text('Delivery fee',style: TextStyle(color: Colors.grey))),
                           Expanded(child: Text('Delivery fee',style: TextStyle(color: Colors.grey))),
                         ],
                       ),
                       const Row(
                         children: [
                           Expanded(child: Text('\$3.99',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17))),
                           Expanded(child: Text('\$3.99',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17))),
                           Expanded(child: Text('\$3.99',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17))),
                         ],
                       ),
                     ],
                   ),
                 ),
        
                 Positioned(
                   top: height * 0.59,
                   left: width * 0.05,
                   child: GestureDetector(
                     onTap: () {
                       // Toggle the selection state on tap
                       setState(() {
                         isSelected = !isSelected;
                       });
                     },
                     child: Container(
                       margin: const EdgeInsets.only(right: 15, top: 12),
                       padding: const EdgeInsets.all(3.5),
                       height: height * 0.06,
                       width: width * 0.50,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(8),
                         color: AColor.loginContainer,
                         border: Border.all(color: Colors.white.withOpacity(0.6)),
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           // Walk Icon Container
                           Expanded(
                             child: Container(
                               height: 39,
                               width: width * 0.10,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(9),
                                 color: isSelected
                                     ? AColor.buttonBackGround
                                     : Colors.transparent,
                               ),
                               child:  Center(child: Text('Delivery',style: TextStyle(color: isSelected? Colors.white: Colors.grey,fontSize: 17,fontWeight: FontWeight.w500))),
                             ),
                           ),
        
                           // Cycle Icon Container
                           Expanded(
                             child: Container(
                               height: 39,
                               width: width * 0.10,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(9),
                                 color: !isSelected
                                     ? AColor.buttonBackGround
                                     : Colors.transparent,
                               ),
                               child:  Center(child: Text('Take Out',style: TextStyle(color: isSelected?  Colors.grey:Colors.white,fontSize: 17,fontWeight: FontWeight.w500))),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
          Positioned(
            top: height * 0.59,
            right: width * 0.05,
            child: Container(
              margin: const EdgeInsets.only( top: 12),
              padding: const EdgeInsets.all(3.5),
              height: height * 0.06,
              width: width * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AColor.loginContainer,
                border: Border.all(color: Colors.white.withOpacity(0.6)),
              ),
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.person_add_alt_1_outlined,color: Colors.white)),
                const Expanded(child: Text('Group Order',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),))
              ],
            ),
            ),
          ),
        
          Positioned(
            top: height * 0.75,
            left: width * 0.05,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.white,size: 32,)),
                    SizedBox(width: width * 0.06),
                    const Text('Featured items',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                     SizedBox(width: width * 0.06),
                    const Text('Appetizers',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                    SizedBox(width: width * 0.07),
                    const Text('Sushi',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                  ],
                ),
            SizedBox(height: height *0.01),
            const TitleText(title: 'Featured Items'),
                SizedBox(height: height *0.02),
                /// vertical card
        GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => const NodleDetailScreen()));
            },
            child: Consumer<FavouriteItem>(builder: (context, value, child) {
              return Container(
                padding: EdgeInsets.only(left: width * 0.04,top: height * 0.03),
                margin: EdgeInsets.only(bottom: height *0.020),
                height: height *0.18,
                width: width * 0.91,
                decoration: BoxDecoration(
                  color: AColor.loginContainer,
                  border: Border.all(color: Colors.white.withOpacity(0.5),width: 0.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(value.itemListOne[index].productName,style: const TextStyle(color: Colors.white,fontSize: 18)),
                        const SizedBox(height: 05),
                        Text(value.itemListOne[index].productDescription,style: const TextStyle(color: Colors.grey,fontSize: 15)),
                        const SizedBox(height: 10),
                        Text(value.itemListOne[index].unitPrice,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16)),

                      ],
                    ),
                    Consumer<FavouriteItem>(builder: (context, value, child) {
                      return GestureDetector(
                        onTap: (){
                          value.selectedFavourites[index];
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image(image: AssetImage(value.itemListOne[index].productThumbNail)),
                            const Positioned(
                                bottom: 20,
                                right: 10,
                                child: IconWidget(icon: Icons.add)),

                          ],
                        ),
                      );
                    },)
                  ],
                ),
              );
            },)
        ),
      
              ],
            ),
          )
               ],
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


