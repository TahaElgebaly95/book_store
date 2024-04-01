import 'package:book_store/core/data/network/helper/dio_helper.dart';
import 'package:book_store/core/data/network/helper/endpoints.dart';
import 'package:book_store/features/home_screen/view_model/cubit/slider_cubit/slider_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/slider_model/sliders_model.dart';

class SlidersCubit extends Cubit<SliderState> {
  SlidersCubit() : super(SliderInitial());

  static SlidersCubit get(context) => BlocProvider.of<SlidersCubit>(context);

  List<Sliders> slidersList = [];

  Future<void> getSliders() async {
    emit(SliderLoading());
    await DioHelper.getData(endpoint: EndPoints.sliders).then((value) {
      for (var e in value.data['data']['sliders']) {
        slidersList.add(Sliders.fromJson(e));
      }
      print(slidersList);
      emit(SliderSuccess());
    }).catchError((error) {
      emit(SliderError(error.toString()));
    });
  }
}
