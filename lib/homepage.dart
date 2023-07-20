import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/blocs/app_blocs.dart';
import 'package:spacex/blocs/app_events.dart';
import 'package:spacex/blocs/app_states.dart';
import 'package:spacex/models/model.dart';
import 'package:spacex/repo/repositories.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SpaceXBloc>(
          create: (BuildContext context) => SpaceXBloc(SpaceXRepository()),
        ),
      ],
      child: Scaffold(appBar: AppBar(title: const Text('SpaceX')), body: blocBody()),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => SpaceXBloc(
        SpaceXRepository(),
      )..add(LoadSpaceXEvent()),
      child: BlocBuilder<SpaceXBloc, SpaceXState>(
        builder: (context, state) {
          if (state is SpaceXLoadingState) {
            return const Center(child: Text("Loading"));
          }
          if (state is SpaceXErrorState) {
            return const Center(child: Text("Error"));
          }
          if (state is SpaceXLoadedState) {
            List<SpaceX> spaceX = state.spaceX;
            final refreshBloc = BlocProvider.of<SpaceXBloc>(context);

            return RefreshIndicator(
              onRefresh: () async {
                refreshBloc.add(LoadSpaceXEvent());
              },
              child: ListView.builder(
                  itemCount: spaceX.length,
                  itemBuilder: (_, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: SizedBox(
                                height: 150,
                                width: 150,
                                child: Image.network(spaceX[0].patch?['small']),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                height: 35,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0x21000000),
                                        offset: Offset(3, 3),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ],
                                ),
                                child: Text(
                                  "SpaceX id: "
                                  '${spaceX[0].id}',
                                  style: const TextStyle(color: Colors.black, fontSize: 17),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0x21000000),
                                        offset: Offset(3, 3),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ],
                                ),
                                child: Text(
                                  "SpaceX name: "
                                  '${spaceX[0].name}',
                                  style: const TextStyle(color: Colors.black, fontSize: 17),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                height: 35,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0x21000000),
                                        offset: Offset(3, 3),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ],
                                ),
                                child: Text(
                                  "SpaceX is details: ${spaceX[0].details != null ? '${spaceX[0].details}' : "We do not know anything"}",
                                  style: const TextStyle(color: Colors.black, fontSize: 17),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0x21000000),
                                        offset: Offset(3, 3),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ],
                                ),
                                child: Text(
                                  "SpaceX flight number: "
                                  '${spaceX[0].flightNumber}',
                                  style: const TextStyle(color: Colors.black, fontSize: 17),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0x21000000),
                                        offset: Offset(3, 3),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ],
                                ),
                                child:
                                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  const Text(
                                    "SpaceX crew member id: ",
                                    style: TextStyle(color: Colors.black, fontSize: 17),
                                  ),
                                  ...?(spaceX[0]
                                      .crewNumbers
                                      ?.map((e) => Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Text(e,
                                                style: const TextStyle(
                                                    color: Colors.black, fontSize: 17)),
                                          ))
                                      .toList())
                                ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0x21000000),
                                        offset: Offset(3, 3),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ],
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    final Uri _url = Uri.parse(spaceX[0].wikiLink?? "");
                                    if (!await launchUrl(_url)) {
                                      throw Exception('Could not launch $_url');
                                    }
                                  },
                                  child: const Text(
                                    "Pres for detailed information ",
                                    style: TextStyle(color: Colors.black, fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 35,
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0x21000000),
                                      offset: Offset(3, 3),
                                      blurRadius: 6,
                                      spreadRadius: 0)
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () async {
                                  final Uri _url = Uri.parse(("https://www.youtube.com/watch?v="+spaceX[0].youtubeId.toString()) ?? "");
                                  if (!await launchUrl(_url)) {
                                    throw Exception('Could not launch $_url');
                                  }
                                },
                                child: const Text(
                                  "Press for watching: ",
                                  style: TextStyle(color: Colors.black, fontSize: 17),
                                ),
                              ),
                            ),
                          ],
                        ));
                  }),
            );
          }

          return Container();
        },
      ),
    );
  }
}
