import 'dart:async';

import 'package:chemical/jsondata/infobloceq.dart';
import 'package:chemical/jsondata/meltingpoint.dart';
import 'package:chemical/jsondata/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_auto/search_autocomplete.dart';
import 'search_auto/search_services.dart';
import 'search_auto/searchbloc.dart';

class info extends StatefulWidget {
  @override
  _infoState createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
      providers: [
        BlocProvider<InfoBloc>(
          create: (context) => InfoBloc(infoRepo: InfoRepo()),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(searchAuto: SearchAuto()),
        )
      ],
      child: Search(),
    ));
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer(milliseconds: 100);
    final infobloc = BlocProvider.of<InfoBloc>(context);
    final searchbloc = BlocProvider.of<SearchBloc>(context);
    var compound_text = TextEditingController();
    var onvalue = "";
    return BlocBuilder<InfoBloc, InfoState>(
      builder: (context, state) {
        if (state is InfoisnotSearch)
          return Column(
            children: [
              TextFormField(
                controller: compound_text,
                onChanged: (value) {
                  onvalue = value;
                  debouncer.run(() {
                    if (onvalue.length >= 3)
                      searchbloc.add(FetchSearch(onvalue));
                    else if (onvalue.isEmpty) {
                      onvalue = "";
                      searchbloc.add(FetchSearch(onvalue));
                    }
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      infobloc.add(FetchInfo(compound_text.text));
                    },
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: Colors.white70, style: BorderStyle.solid)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: Colors.blue, style: BorderStyle.solid)),
                  hintText: "Compound name",
                  hintStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchisActive)
                    return ShowSearchAuto(state.getsearch, onvalue);
                  else if (state is SearchisnotActive) return Spacer();
                },
              )
            ],
          );
        else if (state is InfoIsLoading)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (state is InfoisNotLoaded)
          return Center(
            child: Text("Something went wrong"),
          );
        else if (state is InfoisLoaded)
          return ShowInfo(state.getinfo, compound_text.text);
        else
          return Text("Error");
      },
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
  final compound;

  ShowInfo(this.information, this.compound);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(information.record.recordTitle),
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
  final searchinfo;

  ShowSearchAuto(this.search, this.searchinfo);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final infosearch = search.dictionaryTerms;
          return ListTile(
            title: Text(infosearch.compound[index]),
          );
        },
        itemCount: search.dictionaryTerms.compound == null
            ? 0
            : search.dictionaryTerms.compound.length,
      ),
    );
  }
}
