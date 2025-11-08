
import 'package:book_app_clean_archetecture/Features/home/data/Model/book_model/book_model.dart';
import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';
import 'package:book_app_clean_archetecture/constants.dart';
import 'package:book_app_clean_archetecture/core/utils/api_service.dart';
import 'package:book_app_clean_archetecture/core/utils/function/save_box_data.dart';

abstract class HomeRemoteDataSource {
  Future<List<EntitiesBooks>> fetchFutureBooks({
    int pageNumber = 0
    
  });
  Future<List<EntitiesBooks>> fetchNewsBooks({int pageNumber = 0});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<EntitiesBooks>> fetchFutureBooks({int pageNumber = 0}) async {
    var result = await apiService.get(
        'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}');
    List<EntitiesBooks> books = getBooks(result);
    // Save the fetched books to Hive box cached for future use
    saveBoxData(books, KFuturedBox);

    return books;
  }

  @override
  Future<List<EntitiesBooks>> fetchNewsBooks({int pageNumber = 0}) async {
    var result = await apiService
        .get('volumes?Filtering=free-ebooks&Sorting=newest&q=programming&startIndex=${pageNumber * 10}');
    List<EntitiesBooks> books = getBooks(result);
    saveBoxData(books, KNewsBox);
    return books;
  }

  List<EntitiesBooks> getBooks(Map<String, dynamic> result) {
    List<EntitiesBooks> books = [];
    for (var bookMap in result['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
