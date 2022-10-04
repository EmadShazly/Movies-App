 
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osama2/movies/presentation/screens/movie_details.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/utils/enums.dart';
import '../controller/bloc/movies_bloc.dart';
import '../controller/bloc/movies_states.dart';
 
class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.nowPlayingState != current.nowPlayingState,
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.isLoading:
            const SizedBox(
              height: 1000,
            );
            return const Center(child: CircularProgressIndicator());
          case RequestState.isLoaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.nowPlayingMovies.map(
                  (item) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () {
                       
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MovieDetailScreen(id: item.id);
                        }));
                       },

                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // fromLTRB
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.5, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              height: 560.0,
                              imageUrl:
                                  ApiConstance.urlImage(item.backDropPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: Colors.redAccent,
                                        size: 16.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        'Now Playing'.toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    item.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          case RequestState.isError:
            const SizedBox(
              height: 400,
            );
            return Center(child: Text(state.nowPlayingMessage));
        }
      },
    );
  }
}
