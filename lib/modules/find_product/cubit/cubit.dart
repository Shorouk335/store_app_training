import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/servies/media.dart';
import 'package:store_app/modules/find_product/cubit/states.dart';

class FindProductCubit extends Cubit<FindProductState> {
  FindProductCubit() : super(FindProductInitialState());
  static FindProductCubit get(context) => BlocProvider.of(context);

  File? selectedImage;

  openCameraToFindProduct() async {
    emit(FindProductLoadingState());
    selectedImage = await Media.pickImageFromCamera();
    if (selectedImage != null) {
      emit(FindProductSucessState());
    } else {
      emit(FindProductErrorState());
    }
  }
}
