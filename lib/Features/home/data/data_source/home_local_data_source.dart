import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';
import 'package:book_app_clean_archetecture/constants.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<EntitiesBooks> fetchFutureBooks({int pageNumber = 0});
  List<EntitiesBooks> fetchNewsBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<EntitiesBooks> fetchFutureBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box = Hive.box<EntitiesBooks>(KFuturedBox);
    int length = box.length;
    if (startIndex >= length || endIndex > length) {
      return []; // Return an empty list if the indices are out of bounds
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<EntitiesBooks> fetchNewsBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    int length = Hive.box<EntitiesBooks>(KNewsBox).length;
    if (startIndex>= length ||endIndex> length){
      return []; // Return an empty list if the indices are out of bounds
    }
    var box = Hive.box<EntitiesBooks>(KNewsBox);
    return box.values.toList().sublist( startIndex, endIndex);
  }
}
