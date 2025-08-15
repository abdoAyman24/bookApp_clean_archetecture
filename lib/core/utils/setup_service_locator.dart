
import 'package:book_app_clean_archetecture/Features/home/data/data_source/home_local_data_source.dart';
import 'package:book_app_clean_archetecture/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:book_app_clean_archetecture/Features/home/data/repo/home_repo_impl.dart';
import 'package:book_app_clean_archetecture/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(
      Dio(),
    ),
  );

  getIt.registerLazySingleton<homeRepoImple>(
    () => homeRepoImple(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
}
