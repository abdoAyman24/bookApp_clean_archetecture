import 'package:book_app_clean_archetecture/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:book_app_clean_archetecture/core/utils/api_service.dart';
import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


import 'book_api_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late HomeRemoteDataSourceImpl dataSource;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    dataSource = HomeRemoteDataSourceImpl(mockApiService);
  });

  group('HomeRemoteDataSourceImpl', () {
    final mockApiResponse = {
      "items": [
        {
          "id": "book1",
          "volumeInfo": {
            "title": "Clean Code",
            "authors": ["Robert C. Martin"],
            "imageLinks": {"thumbnail": "https://example.com/image1.jpg"},
          }
        },
        {
          "id": "book2",
          "volumeInfo": {
            "title": "Flutter for Beginners",
            "authors": ["John Doe"],
            "imageLinks": {"thumbnail": "https://example.com/image2.jpg"},
          }
        }
      ]
    };

    test('fetchFutureBooks returns list of EntitiesBooks', () async {
      // Arrange
      when(mockApiService.get(any)).thenAnswer((_) async => mockApiResponse);

      // Act
      final result = await dataSource.fetchFutureBooks();

      // Assert
      expect(result, isA<List<EntitiesBooks>>());
      expect(result.length, 2);
      expect(result.first.title, "Clean Code");
      expect(result.last.title, "Flutter for Beginners");

      verify(mockApiService.get(any)).called(1);
    });

    test('fetchFutureBooks throws exception on API error', () async {
      // Arrange
      when(mockApiService.get(any)).thenThrow(Exception('Network error'));

      // Act & Assert
      expect(() => dataSource.fetchFutureBooks(), throwsException);
    });

    test('fetchNewsBooks returns list of EntitiesBooks', () async {
      // Arrange
      when(mockApiService.get(any)).thenAnswer((_) async => mockApiResponse);

      // Act
      final result = await dataSource.fetchNewsBooks();

      // Assert
      expect(result, isA<List<EntitiesBooks>>());
      expect(result.first.title, "Clean Code");
      verify(mockApiService.get(any)).called(1);
    });
  });
}