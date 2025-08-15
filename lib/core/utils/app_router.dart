
import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';
import 'package:book_app_clean_archetecture/Features/home/domain/use_case/featch_future_Books_Use_Case.dart';
import 'package:book_app_clean_archetecture/Features/home/presentation/manager/FeatchFutureBook/featch_future_book_cubit.dart';
import 'package:book_app_clean_archetecture/Features/home/presentation/views/book_details_view.dart';
import 'package:book_app_clean_archetecture/Features/home/presentation/views/home_view.dart';
import 'package:book_app_clean_archetecture/Features/search/presentation/views/search_view.dart';
import 'package:book_app_clean_archetecture/core/utils/setup_service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ), GoRoute(
        path: kBookDetailsView,
        builder: (cotext, state) {
          final data = state.extra as EntitiesBooks?;
          return BlocProvider(
            create: (context) => FeatchFutureBookCubit(getIt.get<FeatchFuturebooksusecase>()),
            child: BookDetailsView(
              books: data !,
            ),
          );
        },
      ),
      
    ],
  );
}
