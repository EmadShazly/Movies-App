import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/utils/enums.dart';
import '../controller/bloc/movies_bloc.dart';
import '../controller/bloc/movies_states.dart';
 
class PopularComponent extends StatelessWidget {
   const PopularComponent({super.key});
 
   @override
   Widget build(BuildContext context) {
     return
     
     BlocBuilder<MovieBloc, MoviesState>(
        buildWhen: (previous, current) =>
            previous.popularState != current.popularState,
        builder: (context, state) {
      
      
      switch(state.popularState){
      
        case RequestState.isLoading:
                    const SizedBox(
              height: 1000,
            );
            return const Center(child: CircularProgressIndicator());

         case RequestState.isLoaded:

         return   FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstance.urlImage(movie.backDropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
    );
          

         case RequestState.isError:
            const SizedBox(
              height: 400,
            );
        return Center(child: Text(state.nowPlayingMessage));



     
    } 
     
    },);
  }
}
