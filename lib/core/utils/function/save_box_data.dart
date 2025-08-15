import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';
import 'package:hive/hive.dart';

void saveBoxData(List<EntitiesBooks> books , boxName) {
      var box = Hive.box<EntitiesBooks>(boxName);
    box.addAll(books);
  }