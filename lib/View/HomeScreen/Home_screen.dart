import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geeksynergy_mechine_task/Controller/Datafetching/bloc/homedata_bloc.dart';
import 'package:geeksynergy_mechine_task/View/HomeScreen/widgets/home_tile.dart';
import 'package:geeksynergy_mechine_task/View/HomeScreen/widgets/shimmer_home.dart';
import 'package:geeksynergy_mechine_task/View/HomeScreen/widgets/showdialoge.dart';

class HomeScreenWrapper extends StatelessWidget {
  const HomeScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomedataBloc(),
      child: const Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    BlocProvider.of<HomedataBloc>(context).add(Homedatafetch());
    super.initState();
  }

  Future refresh() async {
    BlocProvider.of<HomedataBloc>(context).add(Homedatafetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showCompanyInfoDialog(context);
            },
            icon: const Icon(
              Icons.info_rounded,
              size: 30,
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Image.network(
              "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Movie App",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            BlocBuilder<HomedataBloc, HomedataState>(
              builder: (context, state) {
                if (state is DataLoading) {
                  return const ShimmerLoading();
                } else if (state is DataFailed) {
                } else if (state is DataSuccess) {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: refresh,
                      child: ListView.separated(
                        itemCount: state.data.search.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MovieTile(
                            imageUrl: state.data.search[index].poster,
                            title: state.data.search[index].title,
                            year: state.data.search[index].year,
                            type: state.data.search[index].type,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          thickness: 0.4,
                        ),
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
