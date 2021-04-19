import 'dart:async';

import 'package:chemical/jsondata/compoundidconvert/compound_id_bloc.dart';
import 'package:chemical/jsondata/infobloceq.dart';
import 'package:chemical/jsondata/meltingpoint.dart';
import 'package:chemical/jsondata/nextscreen.dart';
import 'package:chemical/jsondata/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'compoundidconvert/compound_id_services.dart';
import 'search_auto/search_autocomplete.dart';
import 'search_auto/search_services.dart';
import 'search_auto/searchbloc.dart';

class info extends StatefulWidget {
  @override
  _infoState createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: MultiBlocProvider(
          providers: [
            BlocProvider<InfoBloc>(
              create: (context) => InfoBloc(infoRepo: InfoRepo()),
            ),
            BlocProvider<SearchBloc>(
              create: (context) => SearchBloc(searchAuto: SearchAuto()),
            ),
            BlocProvider(
              create: (context) =>
                  CompoundIDBloc(compoundCID: CompoundCIDServices()),
            )
          ],
          child: Search(),
        ));
  }
}

class Search extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer(milliseconds: 100);
    final infobloc = BlocProvider.of<InfoBloc>(context);
    final searchbloc = BlocProvider.of<SearchBloc>(context);

    var compound_text = TextEditingController();
    var onvalue = "";

    return BlocListener<InfoBloc, InfoState>(
      listener: (context, state) {
        if (state is InfoisLoaded) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => nextscreen(
              information: state.getinfo,
              compound: compound_text.text,
            ),
          ));
        }
      },
      bloc: infobloc,
      child: BlocBuilder<InfoBloc, InfoState>(
        builder: (context, state) {
          if (state is InfoisnotSearch)
            return Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Material(
                    elevation: 20,
                    shadowColor: Colors.white,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.sentences,
                      autofocus: true,
                      controller: compound_text,
                      onChanged: (value) {
                        onvalue = value;
                        debouncer.run(() {
                          if (onvalue.length >= 3)
                            searchbloc.add(FetchSearch(onvalue));
                          else if (onvalue.isEmpty) {
                            onvalue = "";
                            searchbloc.add(FetchSearch(onvalue));
                            // searchbloc.close();
                          }
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            infobloc.add(FetchInfo(compound_text.text));
                            // infobloc.close();
                          },
                          color: Colors.black87,
                          iconSize: 35,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(15),

                        // enabledBorder: OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(10)),
                        //     borderSide: BorderSide(
                        //         color: Colors.black, style: BorderStyle.solid)),
                        // focusedBorder: OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(7)),
                        //     borderSide: BorderSide(
                        //         color: Colors.black, style: BorderStyle.solid)),
                        hintText: "Compound Name",
                        border: InputBorder.none,

                        hintStyle: TextStyle(
                          fontSize: 22.0,
                          color: Colors.black,
                          fontFamily: "Spotify",
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Rubik",
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                      cursorColor: Colors.black,
                    ),
                  ),
                ),
                BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchisActive)
                      return ShowSearchAuto(state.getsearch, onvalue);
                    else if (state is SearchisnotActive)
                      return Container();
                    else
                      return Center(child: Text("errorrrrr"));
                  },
                )
              ],
            );
          else if (state is InfoIsLoading) {
            // searchbloc.close();
            // infobloc.close();
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is InfoisNotLoaded)
            return Center(
              child: Text("Something went wrong Yoo"),
            );
          else
            return Text("Error");
        },
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class ShowInfo extends StatelessWidget {
  Info information;
  var compound;

  ShowInfo(this.information, this.compound);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            information.record.recordTitle,
            style: TextStyle(
              fontFamily: "Rubik",
              fontWeight: FontWeight.w700,
              fontSize: 40.0,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<InfoBloc>(context).add(ResetInfo());
            },
            child: Text(
              "Search",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
        )
      ],
    );
  }
}

class ShowSearchAuto extends StatelessWidget {
  AutoComplete search;
  CompoundCIDServices compoundCID;
  final searchinfo;
  String comp;
  // var compound_name = "2244";

  ShowSearchAuto(this.search, this.searchinfo);
  @override
  Widget build(BuildContext context) {
    // final compoundbloc = BlocProvider.of<CompoundIDBloc>(context);
    return Container(
      height: 310,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final infosearch = search.dictionaryTerms;
          return Column(
            children: [
              ListTile(
                title: Text(
                  infosearch.compound[index],
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Rubik",
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () async {
                  var compound_nam = infosearch.compound[index];
                  print(compound_nam);

                  try {
                    comp = await CompoundCIDServices()
                        .getcompoundcid(compound_nam);
                  } catch (e) {
                    print(e);
                  }
                  BlocProvider.of<InfoBloc>(context)
                      .add(FetchInfo(comp.trim()));

                  // Do something

                  // compoundbloc.add(FetchCompoundID(compound_nam));

                  // BlocBuilder<CompoundIDBloc, CompoundIdState>(
                  //   builder: (context, state) {
                  //     if (state is AutoCompleteTileisActive)
                  //       return CircularProgressIndicator();
                  //     return (Text("Error"));
                  //   },
                  // );

                  // BlocProvider.of<InfoBloc>(context).add(FetchInfo("244"));
                  //  FutureBuilder(
                  //     future: compoundCID.getcompoundcid(compound_nam),
                  //     builder: (context, snapshot) {
                  //       compound_name = snapshot.data;
                  //       if (compound_name == null) {

                  //       } else {
                  //         BlocProvider.of<InfoBloc>(context)
                  //             .add(FetchInfo(compound_name));
                  //       }
                  //       return Text("Error");
                  //     });

                  // var compound_name = "261";
                  // ignore: unnecessary_statements
                },
              ),
              Divider(
                thickness: 1.5,
                color: Colors.grey,
              ),
            ],
          );
        },
        itemCount: search.dictionaryTerms.compound == null
            ? 0
            : search.dictionaryTerms.compound.length,
      ),
    );
  }
}
