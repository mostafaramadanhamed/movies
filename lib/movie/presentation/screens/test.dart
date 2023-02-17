import 'package:flutter/material.dart';
import 'package:movies/movie/presentation/screens/movies_screen.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MoviesScreen()));
            },
            child: const Text('Go')),
      ),
    );
  }
}
