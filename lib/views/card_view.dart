import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DiscountWidget(percentage: 80,)
          ],
        ),
      ),
    );
  }
}

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({
    super.key,
    required this.percentage,
  });

  final num percentage;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Container(
      height: size.height*.2,
        child: Stack(
          children: [
            SvgPicture.asset('assets/images/Subtract.svg',width:size.width*0.9,height: size.height*0.2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 30,),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: size.height*.03),
                  child: const RotatedBox(

                      quarterTurns: 3,
                    child: FittedBox(child: Text('Discount',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),)),
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                      child: RotatedBox(quarterTurns: 3,child:MySeparator(color:Color(0xff1E1E1E) ) ,)),
                ),
                SizedBox(
                  width: size.width*.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: FittedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text('$percentage% Off',style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                        SizedBox(height: size.height*0.01,),
                        const Text('This coupon use only in\nResturant',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
                        SizedBox(height: size.height*0.04,),
                        const Text('Expire : 15 sep 2024',style: TextStyle(fontWeight: FontWeight.w400),),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width*.04,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: size.height*.025,
                      ),
                      SvgPicture.asset('assets/images/qrCode.svg',height: size.width*.15,width: size.width*.15,),
                      SizedBox(
                        height: size.height*0.01,
                      ),
                      Expanded(
                        child: Padding(
                          padding:  EdgeInsets.only(bottom:size.height*.025,top:size.height*.01),
                          child: Container(

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(100))
                            ),

                              child: Center(child: const Text('USE IT',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w700,),))),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: size.width*.1,)
              ],
            ),


          ],
        ));
  }
}

class SaleWidget extends StatelessWidget {
  const SaleWidget({
    super.key,
    required this.discount,
  });

  final num discount ;

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Positioned(
      left: size.width*.03,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset('assets/images/discount.svg',height: size.height*.07),
            Container(
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('خصم',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 10,),),
                  Text("$discount%",style:const TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14,))
                ],
              ),
            )

          ],
        )
    );
  }
}
class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 3.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}


