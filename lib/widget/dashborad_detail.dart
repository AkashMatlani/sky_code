import 'package:flutter/material.dart';
import '../model/dashboard_model.dart';

// ignore: must_be_immutable
class DashBoardDetail extends StatelessWidget {
  Character? character;
  House? house;

  DashBoardDetail({super.key, required this.character, required this.house});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          titleSpacing: 10.0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          )),
      body: Column(
        children: [
          Card(
              elevation: 2,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Character Name",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            character!.name != null &&
                                    character!.name!.isNotEmpty
                                ? character!.name!
                                : "Coming Soon",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      ),
                    ],
                  ))),
          Card(
              elevation: 2,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Character Slug",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ))),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          character!.slug != null && character!.slug!.isNotEmpty
                              ? character!.slug!
                              : "Coming Soon",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                    )
                  ]))),
          Card(
              elevation: 2,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("House  Name",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ))),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          house!.name != null && house!.name!.isEmpty
                              ? house!.name!
                              : "Coming Soon",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                    )
                  ]))),
          Card(
              elevation: 2,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("House Slug",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ))),
                    const Spacer(),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            house!.slug != null &&
                                    house!.slug != null &&
                                    house!.slug!.isEmpty
                                ? house!.slug!
                                : "Coming Soon",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ))),
                  ]))),
        ],
      ),
    );
  }
}
