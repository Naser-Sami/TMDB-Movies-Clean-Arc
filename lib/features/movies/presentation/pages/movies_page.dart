 import 'package:clean_architecture_structure/features/movies/presentation/bloc/movies/movies_events.dart';
import 'package:clean_architecture_structure/features/movies/presentation/widgets/now_playing_widget.dart';
import 'package:clean_architecture_structure/features/movies/presentation/widgets/popular_widget.dart';
import 'package:clean_architecture_structure/features/movies/presentation/widgets/top_rated_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/config.dart';
import '../../movie.dart';
import '/core/core.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // debug print
    // LoggerDebug.loggerInformationMessage(
    //     sl<GetNowPlayingMoviesUsecase>().hashCode);

    //   return BlocProvider(
    //     create: (context) => MoviesBloc(sl())..add(GetNowPlayingMoviesEvent()),
    //     lazy: true,
    //     child: BlocBuilder<MoviesBloc, MoviesState>(
    //       builder: (context, state) {
    //         // LoggerDebug.loggerInformationMessage(sl<GetNowPlayingMoviesUsecase>().hashCode);
    //         return const Scaffold();
    //       },
    //     ),
    //   );
    // }

    // LoggerDebug.loggerDebugMessage('MoviesPage Build');

    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      lazy: true,
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const NowPlayingWidget(),
              const SwitchThemeBarComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.popular,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(AppStrings.seeMore),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularWidget(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.topRated,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(AppStrings.seeMore),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedWidget(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
