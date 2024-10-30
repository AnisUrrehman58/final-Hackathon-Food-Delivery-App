import 'package:flutter/material.dart';

import '../Utils/Constant/colors.dart';
import '../Utils/Constant/images.dart';
class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.04),
      height: height * 0.24,
      width: double.infinity,
      padding: EdgeInsets.only(
          left: width * 0.04,top: height * 0.09),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AImages.dish),fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(15),
        color: AColor.loginContainer,
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Kinka lzakaya',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27,color: Colors.white)),
          SizedBox(height: height * 0.01),
          Text('Japanese',style: TextStyle(fontSize: 27,color: Colors.white.withOpacity(0.8))),
          // const SizedBox(height: 05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$3.99 fee delivery  | 30 min',style: TextStyle(fontSize: 19,color: Colors.white.withOpacity(0.8))),
              Container(
                margin: const EdgeInsets.only(right: 15),
                height: height * 0.04,
                width: width *0.08,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(07),
                    border: Border.all(color: Colors.white.withOpacity(0.7))
                ),
                child:  Center(child: Text('4.7',style: TextStyle(color: Colors.white.withOpacity(0.7)))),
              )
            ],
          )

        ],
      ),
    );
  }
}
