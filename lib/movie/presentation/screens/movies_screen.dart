import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movie/presentation/controller/movies_bloc.dart';
import 'package:movies/movie/presentation/controller/movies_event.dart';

import '../../../core/services/service_locator.dart';
import '../controller/movies_states.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (context) =>
      MoviesBloc(sl())
        ..add(GetNowPlayingMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesStates>(
        builder: (context, state) {
          print(state);
          return Scaffold();
        },
      ),
    );
  }
}
