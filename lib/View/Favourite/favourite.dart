import 'package:flutter/material.dart';
import '../../CustomWidgets/light_text.dart';
import '../../CustomWidgets/title_text.dart';
import '../../Utils/Constant/colors.dart';
import '../../Utils/Constant/images.dart';
import '../TrackOrder/track_order_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  Widget _buildTransparentButton(double height, double width) {
    return Container(
      color: Colors.transparent, // Ensure no background color
      margin: const EdgeInsets.only(bottom: 30, left: 15, right: 30),
      child: SizedBox(
        height: height * 0.05,
        width: width * 0.60,
        child: ElevatedButton(
          onPressed: () {
            showCustomBottomSheet(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AColor.buttonBackGround, // Fully transparent button
            // shadowColor: Colors.transparent, // Remove shadow completely
            elevation: 0, // Ensure no elevation
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              // side: const BorderSide(color: Colors.white), // Optional: Add border
            ),
          ),
          child: const Text(
            'Go to Checkout ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }



  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor:  AColor.loginContainer,
      barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;
        return SizedBox(
          height: height * 0.27, // 50% of screen height
          child: Padding(
            padding:  EdgeInsets.all(height *0.03),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal',style: TextStyle(color: Colors.white,fontSize: 17)),
                    Text('\$16.00',style: TextStyle(color: Colors.white,fontSize: 17)),
                  ],
                ),
                SizedBox(height: height * 0.02),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delivery',style: TextStyle(color: Colors.white,fontSize: 17)),
                    Text('\$2.00',style: TextStyle(color: Colors.white,fontSize: 17)),
                  ],
                ),
                SizedBox(height: height * 0.02),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500)),
                    Text('\$18.00',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(height: height * 0.02),
                SizedBox(
                  width: width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const TrackOrderScreen()));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: AColor.buttonBackGround,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    child: const Text('Checkout',style: TextStyle(color:  Colors.white,fontSize: 20,fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


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
              height: height * 1.1,
              width: width,
              decoration: BoxDecoration(
                /// BackGround Image
                image: DecorationImage(image: AssetImage(AImages.backGroundImages),fit: BoxFit.cover,repeat: ImageRepeat.repeat),
              ),
              child:  Padding(
                padding:  EdgeInsets.only(top: height * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          // Navigator.pop(context);
                        }, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 23)),
          SizedBox(width: width * 0.27,),

          const Text('Favourite',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500,color: Colors.white)),
                 const Text('')
                      ],
                    ),

                    SizedBox(height: height * 0.02),
                    SizedBox(height: height * 0.02),

                    /// order Detail card
                    Expanded(
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return  Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: height * 0.03),
                                height: height * 0.16,
                                width: width * 0.42,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(image: AssetImage(AImages.node),fit: BoxFit.cover)
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top: height * 0.01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const TitleText(title: '\$16.00\nChicken Veggi Salad'),
                                    const LightText(text: 'With cheese sauce'),
                                    SizedBox(height: height * 0.01),
                                    Row(

                                      children: [
                                        Container(
                                            height: height *0.04,
                                            width:  width * 0.25,
                                            decoration: BoxDecoration(
                                                color:Colors.white,
                                                borderRadius: BorderRadius.circular(07),
                                                border: Border.all(color: Colors.white.withOpacity(0.5))
                                            ),
                                            child:  Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Positioned(
                                                    bottom: 0,
                                                    left: -10,
                                                    child: TextButton(onPressed: (){}, child: const Icon(Icons.minimize,))),
                                                const SizedBox(width: 10),
                                                const Center(child: Text('01',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600))),
                                                Positioned(
                                                    top: -08,
                                                    right: -10,
                                                    child: TextButton(onPressed: (){}, child: const Icon(Icons.add))),


                                              ],
                                            )
                                        ),
                                        InkWell(
                                          onTap: (){},
                                          child: Container(
                                            margin: EdgeInsets.only(left: width * 0.15),
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(08),
                                            ),
                                            child:const Icon( Icons.delete),
                                          ),
                                        )
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          );

                        },),
                    )

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
        bottomNavigationBar:
        _buildTransparentButton(height, width)
    );

  }
}



