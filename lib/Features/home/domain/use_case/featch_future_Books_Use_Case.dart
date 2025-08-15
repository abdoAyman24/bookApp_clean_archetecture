
import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';
import 'package:book_app_clean_archetecture/Features/home/domain/Repos/home_repo.dart';
import 'package:book_app_clean_archetecture/core/error/failure.dart';
import 'package:book_app_clean_archetecture/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FeatchFuturebooksusecase extends UseCase<List<EntitiesBooks>, int > {
  final HomeRepo homeRepo;

  FeatchFuturebooksusecase({required this.homeRepo});

  @override
  Future<Either<Failure, List<EntitiesBooks>>> call([int pageNumber=0]) async {
    return homeRepo.fetchFutureBooks(pageNumber: pageNumber);
  }
}
