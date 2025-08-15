
import 'package:book_app_clean_archetecture/Features/home/data/data_source/home_local_data_source.dart';
import 'package:book_app_clean_archetecture/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';
import 'package:book_app_clean_archetecture/Features/home/domain/Repos/home_repo.dart';
import 'package:book_app_clean_archetecture/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class homeRepoImple extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  homeRepoImple(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<EntitiesBooks>>> fetchFutureBooks({int pageNumber = 0}) async {
    try {
      List<EntitiesBooks> books;
      books = homeLocalDataSource.fetchFutureBooks(pageNumber:  pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFutureBooks(pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioError){
        return left(ServerFailuer.fromDioError( e));
      }
      return left(ServerFailuer( e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EntitiesBooks>>> fetchNewsBooks() async {
    try {
      List<EntitiesBooks> books;
      books = homeLocalDataSource.fetchNewsBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewsBooks();
      return right(books);
    } catch (e) {
       if (e is DioError){
        return left(ServerFailuer.fromDioError( e));
      }
      return left(ServerFailuer( e.toString()));
    }
  }
}
