import 'package:book_app_clean_archetecture/Features/home/data/repo/home_repo_impl.dart';
import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';
import 'package:book_app_clean_archetecture/Features/home/domain/use_case/featch_future_Books_Use_Case.dart';
import 'package:book_app_clean_archetecture/Features/home/domain/use_case/featch_newse_books_usecase.dart';
import 'package:book_app_clean_archetecture/Features/home/presentation/manager/FeatchFutureBook/featch_future_book_cubit.dart';
import 'package:book_app_clean_archetecture/Features/home/presentation/manager/featchNewsBooks/featch_news_books_cubit.dart';
import 'package:book_app_clean_archetecture/constants.dart';
import 'package:book_app_clean_archetecture/core/utils/app_router.dart';
import 'package:book_app_clean_archetecture/core/utils/setup_service_locator.dart';
import 'package:book_app_clean_archetecture/core/utils/simple_bloce_observer.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  setupServiceLocator();
  await Hive.initFlutter();
  // Register the adapter for EntitiesBooks
  Hive.registerAdapter(EntitiesBooksAdapter());
  // Open the Hive box for future books
  await Hive.openBox<EntitiesBooks>(KFuturedBox);
  await Hive.openBox<EntitiesBooks>(KNewsBox);
  Bloc.observer = simpleBlocObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeatchFutureBookCubit(
            FeatchFuturebooksusecase(homeRepo: getIt.get<homeRepoImple>()),
          )..featchFutureBooks(),
        ),
        BlocProvider(
          create: (context) => FeatchNewsBooksCubit(
            FeatchNewsebooksusecase(homeRepo: getIt.get<homeRepoImple>()),
          )..featchNewsBooks(),
        ), // Assuming you have an AppRouter
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
