import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import '../../Utils/Constant/colors.dart';
import '../../Utils/Constant/images.dart';
import '../../Utils/Constant/text.dart';
import '../BottomNavigation/bottom_navigation_menu.dart';
import 'StepperDataList/stepper_data_list.dart';
class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  Scaffold(
      // backgroundColor: AColor.loginContainer,
      /// Order Screen
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 1.01,
              width: double.infinity,
              decoration: BoxDecoration(
                /// BackGround Image
                image: DecorationImage(image: AssetImage(AImages.backGroundImages),fit: BoxFit.cover,repeat: ImageRepeat.repeat),
              ),
              child:  Padding(
                padding:  EdgeInsets.only(top: height * 0.05,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 23)),

                    SizedBox(height: height * 0.02),
                     Padding(
                      padding:  EdgeInsets.only(left: width * 0.05,right:width * 0.07),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Track order ',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500,color: Colors.white)),
                          SizedBox(height: height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AText.orderId,style: const TextStyle(color: Colors.white,fontSize: 17)),
                              const Text('Today',style: TextStyle(color: Colors.white,fontSize: 17)),

                            ],
                          ),
                          SizedBox(height: height * 0.02),

                          Padding(
                            padding:  EdgeInsets.only(left: width * 0.40),
                            child: AnotherStepper(
                              stepperList: stepperData,
                              barThickness: 1.8,
                              verticalGap: height * 0.04,
                              activeIndex: 2,
                              activeBarColor: Colors.white,
                              inActiveBarColor: Colors.grey,
                              stepperDirection: Axis.vertical,
                              iconHeight: 18,
                              iconWidth: 18,
                            ),
                          ),


                        ],
                      ),

                    ),
                    const Center(child: Text('Order Track',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white))),
                    SizedBox(height: height * 0.02),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.08),
                      padding: EdgeInsets.all(height *0.02),
                      height: height * 0.23,
                      width: width * 0.85,
                      decoration: BoxDecoration(
                          color: AColor.loginContainer,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(AImages.profile),
                              SizedBox(width: width*0.05),
                                Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Mr Kemplas',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16)),
                                  const SizedBox(height:05),
                                  const Text('25 minutes on the way',style: TextStyle(color: Colors.white)),
                                  SizedBox(height: height * 0.07,),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                              width:  width * 0.6,
                              child: ElevatedButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const BottomNavigationMenu()));
                              },
                                  style: ElevatedButton.styleFrom(backgroundColor: AColor.buttonBackGround,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))
                                  ),
                                  child: const Text('Call',style: TextStyle(color: Colors.white,fontSize: 18),)))

                        ],
                      ),
                    )
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
