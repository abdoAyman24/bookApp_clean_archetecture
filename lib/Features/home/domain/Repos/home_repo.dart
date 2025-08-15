
import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';
import 'package:book_app_clean_archetecture/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<EntitiesBooks>>> fetchFutureBooks({
    required int pageNumber,
  });
  Future<Either<Failure, List<EntitiesBooks>>> fetchNewsBooks();
}
