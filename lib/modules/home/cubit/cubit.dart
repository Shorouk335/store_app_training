import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/modules/home/cubit/states.dart';
import 'package:store_app/modules/home/domain/model/model.dart';
import 'package:store_app/modules/home/domain/repository/repository.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<HomeModel>?  homeListData;

  getItems() async {
    emit(HomeGetLoadingState());
    final response = await HomeRepo.list();
    if (response != null) {
      // homeListData = response?.dataList;
      emit(HomeGetSuccessState());
    } else {
      homeListData = [];
      emit(HomeGetErrorState());
    }
  }

  Future<HomeModel?> show({required int id}) async { 
    if (id == null) return null;
    emit(HomeShowLoadingState());
    final response = await HomeRepo.show(id: id);
    if (response != null) {
      emit(HomeShowSuccessState());
      return response ;
  
    } else {
      emit(HomeShowErrorState());

      return null ;
    }
  }

  store({ required HomeModel homeModel}) async {
    emit(HomePostLoadingState());
     await HomeRepo.add( homeModel: homeModel).then((value) {
     if (value != null){
          emit(HomePostSuccessState()); 
          getItems();
       // await Alerts.snack(text: value["message"]??"", state: SnakState.success);
       // GoRouter.of(context).pop(true);
     }else {
      emit(HomePostErrorState());
     }

    }

   
    );

    
  }

  update({required int id, required HomeModel homeModel}) async {
    emit(HomeUpdateLoadingState());
     await HomeRepo.update(id: id, homeModel: homeModel).then((value) {
  if (value != null) {
      emit(HomeUpdateSuccessState());
      getItems();
         // await Alerts.snack(text: value["message"]??"", state: SnakState.success);
       // GoRouter.of(context).pop(true);
    } else {
      emit(HomeUpdateErrorState());
    }

     }
     
     );
    
  }

  delete({required int id}) async {
    emit(HomeDeleteLoadingState());
    await HomeRepo.delete(id: id).then((value) {
    if (value != null) {
      emit(HomeDeleteSuccessState());
     // await Alerts.snack(text: value["message"]??"", state: SnakState.success);
      getItems();
    } else {
      emit(HomeDeleteErrorState());
    }

    });
   
  }

}
