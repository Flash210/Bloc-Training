import 'package:bloct_training/busnisess_logic/cubit/my_cubit.dart';
import 'package:bloct_training/constants/my_colors.dart';
import 'package:bloct_training/data/models/model.dart';
import 'package:bloct_training/presentation/screens/home_screen/widget/film_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   List<Results> allFilms=[];
/*
  @override
  void initState() {
    super.initState();
    allFilms = BlocProvider.of<MyCubit>(context).getAll();
    // this a request from the Ui to to the cubit to get the method getALl
    //so the bloc provider will run and wake up the cubit hhh because he is lazy work only when they need him and take data from him and the cubit from where
    // where he get the data ? from the repository of course
  }*/


// List<Results> allFilms = [];

  Future<void> fetchData() async {
    allFilms = await BlocProvider.of<MyCubit>(context).getAll();
    // You can handle the fetched data as needed
    setState(() {}); // Trigger a rebuild after fetching data
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: MyColors.myYellow,
            title: const Text(
              "Films",
              style: TextStyle(color: MyColors.myGrey),
            )),
        body: buildBlocWidget());
  }

  Widget buildBlocWidget() {
    return BlocBuilder<MyCubit, MyState>(builder: (context, state) {
      if (state is DataLoaded) {
        print("eeeee ${state.films.length}");
        allFilms = (state).films;
        return buildLoadedListWidget();
      } else {
        return const Center(child: CircularProgressIndicator());
      }
      
    });
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [buildFilmsList()],
        ),
      ),
    );
  }

  Widget buildFilmsList() {
      print("Number of films: ${allFilms.length}");

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      shrinkWrap: true,
     physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allFilms.length,
      itemBuilder: (context, index) {
        return FilmItem(films: allFilms[index],);
     
      },
    );
  }
}
