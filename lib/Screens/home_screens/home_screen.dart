import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie/Screens/DiscScreens/disc_screen.dart';
import 'package:movie/constant.dart';
import 'package:movie/controller/getpopular.dart';
import 'package:movie/controller/gettoprate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List is_favorited=[];

  fav(int length){
    for(int i=0 ;i<length;i++){
      is_favorited.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 3,
        centerTitle: true,
        title: Text(
          "Netflix",
          style: TextStyle(
            color: primarycolor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: primarycolor,
          )
        ],
      ),
      body: Column(
        children: [
          Consumer(
            builder: (BuildContext context,
                T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
              //viewmodeltoprate read data in getdatatoprate provider
              var viewmodeltoprate = watch(getdatatoprate);
              return (viewmodeltoprate.listDataModel.length == 0)?SizedBox(height: 0,):
              CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  viewportFraction: 0.9,
                  height: 250,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 600),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                itemCount: viewmodeltoprate.listDataModel.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return GridTile(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.red,
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: Image.network(
                              image_url +
                                  viewmodeltoprate
                                      .listDataModel[index].poster_path,
                              fit: BoxFit.fill,
                            )),
                      ),
                    ),
                    footer: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      child: Text(
                        viewmodeltoprate.listDataModel[index].title.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Expanded(
            child: Consumer(
              builder: (BuildContext context,
                  T Function<T>(ProviderBase<Object?, T>) watch,
                  Widget? child) {
                //viewmodelpopular read data in getdatapopular provider
                var viewmodelpopular = watch(getdatapopular);
                fav(viewmodelpopular.listDataModel.length);
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: StaggeredGridView.countBuilder(
                      itemCount: viewmodelpopular.listDataModel.length,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                      itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                return DiscScreens(id: viewmodelpopular.listDataModel[index].id, vote_average: viewmodelpopular.listDataModel[index].vote_average, title: viewmodelpopular.listDataModel[index].title, overview: viewmodelpopular.listDataModel[index].overview, poster_path: viewmodelpopular.listDataModel[index].poster_path,);
                              }));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 5,
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          child: Image.network(image_url +
                                              viewmodelpopular
                                                  .listDataModel[index].poster_path),
                                        ),
                                        Positioned(
                                          top: 10,
                                          right: 5,
                                          child: IconButton(
                                            onPressed: (){
                                              setState(() {
                                                if(is_favorited[index]){
                                                  is_favorited[index]=false;
                                                }else{
                                                  is_favorited[index]=true;
                                                }
                                              });
                                            },
                                            icon: (is_favorited[index])?Icon(Icons.favorite,
                                              color: Colors.red,
                                              size: 35,
                                            ):Icon(Icons.favorite_border,
                                              color: black,
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "${viewmodelpopular.listDataModel[index].title}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 16,
                                            fontWeight: FontWeight.w600
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                      }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
