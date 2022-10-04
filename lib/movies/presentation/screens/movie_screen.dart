 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osama2/core/services/services_local.dart';
import 'package:osama2/core/strings/app_string.dart';
import 'package:osama2/movies/presentation/components/now_playing_component.dart';
import 'package:osama2/movies/presentation/components/popular_component.dart';
import 'package:osama2/movies/presentation/components/top_rated_component.dart';
import '../controller/bloc/movies_bloc.dart';
import '../controller/bloc/movies_events.dart';
 
class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


 
     return BlocProvider<MovieBloc>(
      create: (BuildContext context) => sl<MovieBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(
          GetTopRatedMoviesEvent(),
        ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponent(),
              Container(  
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.popular,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          textStyle: const TextStyle(
                            color: Colors.white,),),),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                                  Text(
                                    AppString.seeMore,
                                    style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,color: Colors.white,
                              size: 16.0,
                            )
                                ]
                        )
                      )
                    )
                  ]
                )
              ),
              const PopularComponent(),
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
                      AppString.topRated,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          textStyle:const TextStyle(
                            color: Colors.white,
     )
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              AppString.seeMore,
                              style: TextStyle(
                                color: Colors.white,
     ),),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,color:Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
         ),
     );
  }
}
