import 'package:another_stepper/dto/stepper_data.dart';
import 'package:flutter/material.dart';


List<StepperData> stepperData = [
  /// First data
  StepperData(
      title: StepperText('Confirmed',textStyle: const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500)),
      iconWidget: Container(
        decoration:  const BoxDecoration(
          color: Colors.white,
          // shape: BoxShape.circle
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child:  const Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                left: -80,
                child: Text('04:30pm',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),))
          ],
        ),
        // child: const Icon(Icons.check_circle_rounded,color: Colors.white,size: 20,),
      )
  ),

  /// 2nd data
  StepperData(
      title: StepperText('Precessing',textStyle: const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500)),
      iconWidget: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child:  const Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                left: -80,
                child: Text('04:38pm',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),))
          ],
        ),
      )
  ),

  /// third  data
  StepperData(
      title: StepperText('On the way',textStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white)),
      iconWidget: Container(
        height: 15,
        width: 15,
        padding: const EdgeInsets.all(8),
        decoration:  const BoxDecoration(
          color: Colors.white,
          // border: Border.all(color: AColors.primaryLight),
          shape: BoxShape.circle,
        ),
        child:  const Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                left: -80,
                child: Text('04:42pm',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),))
          ],
        ),
      )
  ),
  /// final  data
  StepperData(
      title: StepperText('Delivered',textStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white)),
      iconWidget: Container(
        decoration:  BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          // border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child:  const Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                left: -80,
                child: Text('04:46pm',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),))
          ],
        ),
        // child:  Stack(
        //   children: [
        //     const Center(child: Icon(Icons.history,color: Colors.green,size: 25,),),
        //     Center(child: SpinKitPulse(color: Colors.green.withOpacity(0.7),size: 50,)),
        //   ],
        // ),
      )
  ),
];
