import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/Router/navigation_service.dart';
import 'package:store_app/core/Router/router.dart';
import 'package:store_app/core/servies/media.dart';

import 'package:store_app/modules/layout/cubit/states.dart';
import 'package:store_app/shared/widgets/showSmartDialog.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(InitialLayoutState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  late TabController? tabController;

  changeTabController(int tab) {
    tabController!.animateTo(tab);
    emit(ChangeTabControllerState());
  } 

  bool isKeyboardVisible = false;


   File? selectedImage;

  openCameraToFindProduct() async {
    emit(FindProductLoadingState());
    selectedImage = await Media.pickImageFromCamera();
    if (selectedImage != null) { 
    
      emit(FindProductSucessState());
      NavigationService.pushNamed(AppRouter.findProductRoute , extra: selectedImage);
      
      print("picture doooooooooooooooooooooooooooone");
    } else {
      emit(FindProductErrorState());
       print("picture errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrooooooooorrr");
    }
  }

}
