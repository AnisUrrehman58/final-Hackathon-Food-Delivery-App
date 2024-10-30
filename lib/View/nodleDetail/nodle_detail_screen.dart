import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/check_box_widget.dart';
import '../../CustomWidgets/icons_widgets.dart';
import '../../CustomWidgets/light_text.dart';
import '../../CustomWidgets/title_text.dart';
import '../../Utils/Constant/colors.dart';
import '../../Utils/Constant/images.dart';
import '../../Utils/Constant/text.dart';
import '../Favourite/favourite.dart';

class NodleDetailScreen extends StatefulWidget {
  const NodleDetailScreen({super.key});

  @override
  State<NodleDetailScreen> createState() => _NodleDetailScreenState();
}

class _NodleDetailScreenState extends State<NodleDetailScreen> {

  int countValue = 1;
  void counter(){
    setState(() {
      countValue++;
    });
  }
  void minus(){
   if(countValue >0){
     setState(() {
       countValue--;
     });
   }
  }
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: AColor.loginContainer,
      /// Detail Screen
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 1.01,
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
                      Image.asset(AImages.nodeDetail),

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
                              onTap: (){},
                              child: const IconWidget(icon: Icons.favorite_outline,))),

                      Positioned(
                          right: width * 0.02,
                          top: height * 0.06,
                          child:  InkWell(
                              onTap: (){
                                Get.to(() => const FavouriteScreen());
                              },
                              child: const IconWidget(icon: Icons.shopping_bag_outlined))),

                      Container(
                        padding: EdgeInsets.only(left: width * 0.04,top: height * 0.02),
                        margin: EdgeInsets.symmetric(horizontal: width * 0.05,vertical: height * 0.38),
                        height: height *0.22,
                        width: width * 80,
                        decoration: BoxDecoration(
                          color: AColor.loginContainer.withOpacity(0.8),
                          border: Border.all(color: Colors.white.withOpacity(0.5),width: 0.8),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TitleText(title: 'Udon Miso \n\$16.00'),
                            Text(AText.description,style:  TextStyle(color: Colors.white.withOpacity(0.8))),
                         SizedBox(height: height * 0.01),
                         Container(
                           height: height *0.04,
                           width:  width * 0.25,
                           decoration: BoxDecoration(
                             color: AColor.loginContainer.withOpacity(0.8),
                             borderRadius: BorderRadius.circular(07),
                             border: Border.all(color: Colors.white.withOpacity(0.5))
                           ),
                           child:  Stack(
                             clipBehavior: Clip.none,
                             children: [
                               Positioned(
                                   bottom: 0,
                                   left: -10,
                                   child: TextButton(onPressed: (){
                                     minus();
                                   }, child: const Icon(Icons.minimize,color: Colors.white,))),
                               const SizedBox(width: 10),
                                Center(child: Text(countValue.toString(),style: const TextStyle(color: Colors.white,fontSize: 18))),
                               Positioned(
                                   top: -08,
                                   right: -10,
                                   child: TextButton(onPressed: (){
                                     counter();
                                   }, child: const Icon(Icons.add,color: Colors.white,))),


                             ],
                           )
                         ),
                          ],
                        ),
                      ),
                      /// Required Item
                      Positioned(
                          top: height * 0.7,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: height * 0.02,left: width * 0.03,right: width * 0.04),
                                height: height * 0.80,
                                width: width,
                                decoration: BoxDecoration(
                                  color: AColor.loginContainer,
                                ),
                                child: Column(

                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const TitleText(title: 'Noodle type'),
                                        SizedBox(
                                            height: height * 0.04,
                                            child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                                              side: BorderSide(color: Colors.white.withOpacity(0.2)),
                                                backgroundColor: AColor.loginContainer.withOpacity(0.4),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                                child: const Text('Required',style: TextStyle(color: Colors.white),)))

                                      ],
                                    ),
                                    SizedBox(height: height * 0.02),
                                    /// Check Box 1
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        LightText(text: 'Thin'),
                                        CheckBoxWidgets(),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.02),
                                    /// Check Box 2
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        LightText(text: 'Thick'),
                                        CheckBoxWidgets(),
                                      ],
                                    ),       SizedBox(height: height * 0.02),
                                    /// Check Box 3
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        LightText(text: 'Udon'),
                                        CheckBoxWidgets(),
                                      ],
                                    ),       SizedBox(height: height * 0.02),
                                    /// Check Box
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        LightText(text: 'Spicy'),
                                        CheckBoxWidgets(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: width *0.07,vertical: 21),
        height: height * 0.10,
        width: width,
        color: AColor.loginContainer,
        child: SizedBox(
            child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
              backgroundColor: AColor.buttonBackGround,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
                child:  Text(AText.addToBasket,style: const TextStyle(color: Colors.white),))),
      ),
    );

  }
}



