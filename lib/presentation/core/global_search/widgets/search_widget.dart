import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter/material.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_action.dart';
import 'package:bewell_pro_core/application/redux/states/app_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/presentation/core/global_search/models/search_result.dart';
import 'package:bewell_pro_core/presentation/core/global_search/models/search_suggestion.dart';
import 'package:bewell_pro_core/presentation/core/home/models/bottom_navigation_bar_items.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';

/// Shows a full screen search page and returns the search result selected by
/// the user when the page is closed.
///
/// The search page consists of an app bar with a search field and a body which
/// can either show suggested search queries or the search results.
///
///
class SearchWidget extends SearchDelegate<String> {
  late int key;

  //Get the roles the user is allowed
  List<String> getUserRoles(BuildContext context) {
    final List<String> acceptedUserRoles = <String>[];

    for (int i = 0; i < defaultNavItems.length; ++i) {
      acceptedUserRoles.add(defaultNavItems[i].title!);
    }

    for (int i = 0; i < defaultSecondaryNavItems.length; ++i) {
      acceptedUserRoles.add(defaultSecondaryNavItems[i].title!);
    }

    return acceptedUserRoles;
  }

  void searchResultsFunction(BuildContext context) {
    searchResults.map((SearchResult result) {
      if (searchResults[key].name.contains(result.name) ||
          searchResults[key].aliases.contains(result.name)) {
        result.onTap(context);
      }
    }).toList();
  }

  void searchSuggestionsFunction(
    BuildContext context,
    List<SearchSuggestion> suggestionList,
    int index,
  ) {
    searchSuggestions.map((SearchSuggestion suggestion) {
      //showResults(context);

      if (suggestionList[index].name.contains(suggestion.name) ||
          suggestionList[index].aliases.contains(suggestion.name)) {
        suggestion.onTap(context);
      }
    }).toList();
  }

  void updateNavigationIndex(
      BuildContext context, List<dynamic> suggestionList, int index) {
    final int bottomIndex = defaultNavItems.indexWhere(
        (NavigationItem element) =>
            element.route! == suggestionList[index].route);
    final int drawerIndex = defaultSecondaryNavItems.indexWhere(
        (NavigationItem element) =>
            element.route! == suggestionList[index].route);

    final int nestedIndex =
        defaultSecondaryNavItems.indexWhere((NavigationItem element) {
      int x = -1;
      if (element.nestedItems != null) {
        x = element.nestedItems!.indexWhere((NavigationNestedItem element) =>
            element.route == suggestionList[index].route);
      }

      if (x > -1) {
        return true;
      } else {
        return false;
      }
    });

    if (bottomIndex > -1) {
      StoreProvider.dispatch<AppState>(
        context,
        NavigationAction(
            bottomBarSelectedIndex: bottomIndex, drawerSelectedIndex: -1),
      );
    }

    if (drawerIndex > -1) {
      StoreProvider.dispatch<AppState>(
        context,
        NavigationAction(drawerSelectedIndex: drawerIndex),
      );
    }

    if (nestedIndex > -1) {
      StoreProvider.dispatch<AppState>(
        context,
        NavigationAction(drawerSelectedIndex: nestedIndex),
      );
    }
  }

  /// Trailing AppBar actions
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          key: AppWidgetKeys.searchCancel,
          tooltip: clearText,
          icon: const Icon(Icons.cancel, color: healthcloudAccentColor),
          onPressed: () {
            query = '';
            close(context, '');
          }),
    ];
  }

  /// Leading AppBar actions
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        key: AppWidgetKeys.backKey,
        tooltip: 'Back',
        icon: const Icon(Icons.arrow_back, color: healthcloudAccentColor),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> acceptedUserRoles = getUserRoles(context);

    if (query.length < 2) {
      return Column(
        key: AppWidgetKeys.smallQueryBuildResultKey,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[Center(child: Text(queryLength))],
      );
    } else {
      key = searchResults.indexWhere(
        (SearchResult element) {
          final bool nameContainsParam =
              element.name.contains(RegExp(query, caseSensitive: false));

          final List<String> aliasFoundResults = element.aliases
              .where(
                (String alias) =>
                    alias.contains(RegExp(query, caseSensitive: false)),
              )
              .toList();

          if (nameContainsParam || aliasFoundResults.isNotEmpty) {
            return true;
          } else {
            return false;
          }
        },
      );

      final List<SearchResult> resultList = searchResults.where(
        (SearchResult result) {
          if (result.role != null) {
            if (!acceptedUserRoles.contains(result.role)) {
              return false;
            }
          }

          final bool nameContainsParam =
              result.name.contains(RegExp(query, caseSensitive: false));

          final List<String> aliasFoundResults = result.aliases
              .where(
                (String alias) =>
                    alias.contains(RegExp(query, caseSensitive: false)),
              )
              .toList();

          if (nameContainsParam || aliasFoundResults.isNotEmpty) {
            return true;
          } else {
            return false;
          }
        },
      ).toList();

      return resultList.isEmpty
          ? const Padding(
              key: AppWidgetKeys.emptyResultListKey,
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text(noQuery)),
            )
          : Column(
              key: AppWidgetKeys.resultListKey,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                verySmallVerticalSizedBox,
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('$resultsText${' "$query"'}',
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                ),
                GestureDetector(
                  key: AppWidgetKeys.resultOnTapKey,
                  onTap: () {
                    updateNavigationIndex(context, searchResults, key);
                    searchResultsFunction(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 150,
                          width: 90,
                          child: Column(
                            children: <Widget>[
                              /// Icon for the result

                              searchResults[key].image,
                              verySmallVerticalSizedBox,
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                  searchResults[key].name,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> acceptedUserRoles = getUserRoles(context);

    final List<SearchSuggestion> suggestionList = query.isEmpty
        ? recentSearches
        : searchSuggestions.where(
            (SearchSuggestion p) {
              //Check if user has role
              if (p.role != null) {
                if (!acceptedUserRoles.contains(p.role)) {
                  return false;
                }
              }

              final bool nameContainsParam =
                  p.name.contains(RegExp(query, caseSensitive: false));

              final List<String> aliasFoundResults = p.aliases
                  .where(
                    (String alias) =>
                        alias.contains(RegExp(query, caseSensitive: false)),
                  )
                  .toList();

              if (nameContainsParam || aliasFoundResults.isNotEmpty) {
                return true;
              } else {
                return false;
              }
            },
          ).toList();
    return suggestionList.isEmpty
        ? const Padding(
            key: AppWidgetKeys.emptySuggestionListKey,
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Center(child: Text(noQuery)),
            ),
          )
        : Column(
            key: AppWidgetKeys.suggestionListKey,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  recentSearchesText,
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) => ListTile(
                    key: AppWidgetKeys.suggestionListViewKey,
                    onTap: () {
                      updateNavigationIndex(context, suggestionList, index);

                      query.isEmpty
                          ? suggestionList[index].onTap(context)
                          : searchSuggestionsFunction(
                              context, suggestionList, index);
                    },
                    leading: suggestionList[index].image,
                    dense: true,
                    title: Text(
                      suggestionList[index].name,
                    ),
                  ),
                  itemCount: suggestionList.length,
                ),
              ),
            ],
          );
  }
}
