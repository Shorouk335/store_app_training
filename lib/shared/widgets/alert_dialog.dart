import 'package:flutter/material.dart';
import 'package:store_app/core/theme/dynamic_theme/colors.dart';


AlertDialog alertDialog(
    Color? backgroundColor,
    AlignmentGeometry? alignment,
    Widget? icon,
    String title,
    Function action1,
    String action1title,
    Function action2,
    String action2title) {
  return AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    backgroundColor: backgroundColor,
    alignment: alignment,
    title: icon ??
        Icon(
          Icons.delete,
          size: 40,
          color: AppColors.primary,
        ),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          // textStyleEnum: TextStyleEnum.title,
          // color: AppColors.onSecondary,
        ),
      ],
    ),
    actions: [
      Card(
          clipBehavior: Clip.hardEdge,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: InkWell(
            onTap: () => action1.call(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: Text(
                action1title,
                // textStyleEnum: TextStyleEnum.normal,
                // color: AppColors.onSecondary,
              ),
            ),
          )),
      Card(
          clipBehavior: Clip.hardEdge,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: InkWell(
            onTap: () {
              action2.call();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: Text(
                action2title,
                // textStyleEnum: TextStyleEnum.normal,
                // color: AppColors.onSecondary,
              ),
            ),
          ))
    ],
  );
}

AlertDialog alertDialogWithNote(
   { Color? backgroundColor,
    AlignmentGeometry? alignment,
    Widget? content,
    String? title,
    Function? action1,
    String? action1title,
    Function? action2,
    String? action2title , 
     Function? action3,
    String? action3title , 
     } 
    
    
    ) {
  return AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    backgroundColor: backgroundColor,
    alignment: alignment,
    title: Text(
      title??"",  
      // textStyleEnum: TextStyleEnum.title,
      // color: AppColors.onSecondary,
    ),
    content: content,
    actions: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: InkWell(
              onTap: () => action1!.call(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Text(
                  action1title??"",
                  // textStyleEnum: TextStyleEnum.normal,
                  // color: AppColors.onSecondary,
                ),
              ),
            )),
      ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: InkWell(
              onTap: () =>
                action2!.call(),
              
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Text(
                  action2title??"",
                  // textStyleEnum: TextStyleEnum.normal,
                  // color: AppColors.onSecondary,
                ),
              ),
            )),
          ), 
          
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: Card(
                     clipBehavior: Clip.hardEdge,
                     elevation: 0,
                     shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                     child: InkWell(
              onTap: () => action3!.call(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Text(
                  action3title??"",
                  // textStyleEnum: TextStyleEnum.normal,
                  // color: AppColors.onSecondary,
                ),
              ),
                     )),
           ),
      
    ],
  );
}
