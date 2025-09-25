import 'package:fruit_hub_dashboard/core/repos/add_image/add_image_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/add_image/add_image_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/repos/add_product/add_product_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/add_product/add_product_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/services/file_storage.dart';
import 'package:fruit_hub_dashboard/core/services/firebase_services.dart';
import 'package:fruit_hub_dashboard/core/services/firestore_services.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:fruit_hub_dashboard/core/services/supabase_sevice.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<StorageService>(SupabaseService());
  getIt.registerSingleton<FirebaseServices>(FirestoreServices());
  getIt.registerSingleton<AddImageRepo>(
    AddImageRepoImpl(getIt.get<StorageService>()),
  );
  getIt.registerSingleton<AddProductRepo>(
    AddProductRepoImpl(getIt.get<FirebaseServices>()),
  );
}
