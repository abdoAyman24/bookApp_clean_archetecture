

import 'package:hive/hive.dart';
part 'entities.g.dart';
@HiveType(typeId: 0)
class EntitiesBooks {
  @HiveField(0)
  final String bookId;
  @HiveField(1)   
  final String? image;
  @HiveField(2)       
  final String? title;
  @HiveField(3)         
  final String? author; 
  @HiveField(4)
  final num price;
  @HiveField(5)
  final num rate;
  @HiveField(6)
  final num number;

  EntitiesBooks(
      {required this.bookId,
      required this.image,
      required this.title,
      required this.author,
      required this.price,
      required this.rate,
      required this.number});
}
