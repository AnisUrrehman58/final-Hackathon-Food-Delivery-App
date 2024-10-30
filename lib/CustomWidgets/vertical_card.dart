import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/provider_state.dart';
import '../Utils/Constant/colors.dart';
import '../Utils/Constant/images.dart';
import 'icons_widgets.dart';

class VerticalCard extends StatelessWidget {
  const VerticalCard({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    int index = 0;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<FavouriteItem>(builder: (context, value, child) {
      return  Container(
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
    },
    );
  }
}
