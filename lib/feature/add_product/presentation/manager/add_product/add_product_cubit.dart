import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/add_image/add_image_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/add_product/add_product_repo.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.addImageRepo, this.addProductRepo)
    : super(AddProductInitial());

  final AddImageRepo addImageRepo;
  final AddProductRepo addProductRepo;

  Future<void> addProduct({
    required AddProductInputEntity addProductInputEntity,
  }) async {
    emit(AddProductLoading());
    var uploadImage = await addImageRepo.addImage(
      image: addProductInputEntity.imageFile,
    );
    uploadImage.fold(
      (failure) {
        emit(AddProductFailure(failure.errMessage));
      },
      (url) async {
        addProductInputEntity.imageUrl = url;
        var product = await addProductRepo.addProduct(
          addProductInputEntity: addProductInputEntity,
        );
        product.fold(
          (failure) {
            emit(AddProductFailure(failure.errMessage));
          },
          (success) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
