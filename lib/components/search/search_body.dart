import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/search_bloc.dart';
import 'package:project_fomo/components/search/genre_grid.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/components/shared/vertical_event_listing.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/utils/structures/page_state.dart';
import 'package:provider/provider.dart';
import '../shared/input_field.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  SearchBloc _bloc;
  TextEditingController _searchController = TextEditingController(
    text: '',
  );

  @override
  void didChangeDependencies() {
    _bloc = Provider.of<SearchBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: _searchController,
          cursorColor: AppTextColor.mediumEmphasis,
          autocorrect: false,
          decoration: InputDecoration(
            alignLabelWithHint: false,
            focusedBorder: AppDecoration.inputFieldUnderline,
            enabledBorder: AppDecoration.inputFieldUnderline,
            icon: Icon(
              Icons.search,
              color: AppColor.dp24,
            ),
            hintText: 'Search...',
            hintStyle: TextStyle(
              color: AppTextColor.mediumEmphasis,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              child: Text(
                "Search",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () => _bloc.search(_searchController.text),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        StreamBuilder(
          stream: _bloc.searchState,
          initialData: PageState(state: SearchState.IDLE),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else if (snapshot.data.state == SearchState.RESULT) {
              return Expanded(
                child: VerticalEventListing(
                  events: snapshot.data.data,
                ),
              );
            } else if (snapshot.data.state == SearchState.LOADING) {
              return LoadingIndicator();
            } else {
              return Expanded(
                child: GenreGrid(),
              );
            }
          },
        ),
      ],
    );
  }
}
