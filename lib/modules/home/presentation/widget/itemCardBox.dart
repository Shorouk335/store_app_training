import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/core/theme/dynamic_theme/colors.dart';
import 'package:store_app/shared/widgets/customtext.dart';
import 'package:store_app/shared/widgets/network_image.dart';

class ItemCardBoxWidget extends StatelessWidget {
  const ItemCardBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: Container(
        
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        width: MediaQuery.of(context).size.width / 2.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white
            ),
        child: Column(
          children: [
            Stack(alignment: Alignment.topRight, children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 150,
                // width: double.infinity , 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const NetworkImagesWidgets(
                  fit: BoxFit.fill,
                  "https://static.wixstatic.com/media/11062b_4d6455c7d7094955a1ebca5b0d537b80~mv2.jpg/v1/fill/w_640,h_612,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/11062b_4d6455c7d7094955a1ebca5b0d537b80~mv2.jpg" ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: AppColors.primary,
                  size: 35.0,
                ),
              )
            ]),
            const SizedBox(
              height: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
              " مضرب تنس" , color: Colors.black54, fontsize: 20.0,
              overflow: TextOverflow.ellipsis,) , 
               const SizedBox(
              height: 5.0,
            ),
            const Row(children: [
              CircleAvatar(backgroundColor: Colors.yellow, radius: 6.0,) , 
              SizedBox(width: 8.0,) , 
              CircleAvatar(backgroundColor: Colors.blue, radius: 6.0,) , 
               SizedBox(width: 8.0,) , 
              CircleAvatar(backgroundColor: Colors.black, radius: 6.0,) , 
               SizedBox(width: 8.0,) , 
              CircleAvatar(backgroundColor: Colors.red, radius: 6.0,) , 
            ],) ,
              const SizedBox(
              height: 5.0,
            ), 
             const CustomText("170.00 ر . س" , color: Colors.black ,
              weight: FontWeight.bold,
              fontsize: 20.0,) , 


              ],
            ) , 
          
          ],
        ),
      ),
    );
  }
}
