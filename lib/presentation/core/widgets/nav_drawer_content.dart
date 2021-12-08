// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/inputs.dart';

// Project imports:
import 'package:bewell_pro_core/application/core/theme/colors.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_action.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_favourite_action.dart';
import 'package:bewell_pro_core/application/redux/flags/flags.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/application/redux/view_models/core_state_view_model.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/asset_strings.dart';
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';

class NavDrawerContent extends StatefulWidget {
  const NavDrawerContent({
    Key? key,
    required this.drawerItems,
    required this.favouriteDrawer,
  }) : super(key: key);

  final List<NavigationItem> drawerItems;
  final bool favouriteDrawer;

  @override
  _NavDrawerContentState createState() => _NavDrawerContentState();
}

class _NavDrawerContentState extends State<NavDrawerContent> {
  final TextEditingController _searchview = TextEditingController();
  bool _firstSearch = true;
  String _query = '';
  List<NavigationItem>? filterList;

  @override
  void initState() {
    super.initState();

    /// Register a closure to be called when the object changes.
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        setState(() {
          _firstSearch = true;
          _query = '';
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchview.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favouriteDrawer && widget.drawerItems.isEmpty) {
      return _noElements();
    } else {
      return StoreConnector<CoreState, CoreStateViewModel>(
          converter: (Store<CoreState> store) =>
              CoreStateViewModel.fromStore(store),
          builder: (BuildContext context, CoreStateViewModel vm) {
            return ListView(
              children: <Widget>[
                smallVerticalSizedBox,

                /// [Search] widget
                Padding(
                  padding: const EdgeInsets.all(number10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: number5),
                    child: Form(
                      child: SILFormTextField(
                        key: AppWidgetKeys.navDrawerSearchKey,
                        controller: _searchview,
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.white,
                        ),
                        customFillColor: primaryColorLight,
                        textInputAction: TextInputAction.search,
                        isSearchFieldSmall: true,
                        keyboardType: TextInputType.text,
                        hintText: navDrawerHintSearchText,
                        hintColor: Colors.white,
                        textStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                smallVerticalSizedBox,

                /// [DrawerItems]
                ///  if search query is empty return list of all items, else return filtered list
                if (_firstSearch) _createListView() else _performSearch(),
              ],
            );
          });
    }
  }

  //display relevant Icon
  IconData getIcon({required bool condition, required bool conditionFlag}) {
    if (!conditionFlag) {
      if (condition) {
        return Icons.star;
      }
      return Icons.star_border;
    } else {
      return Icons.refresh_rounded;
    }
  }

  ListView _createListView() {
    int? selectedindex;
    final int? secondaryNavItemIndex = StoreProvider.state<CoreState>(context)!
        .navigationState
        ?.drawerSelectedIndex;

    final List<NavigationItem>? secondaryNavItem =
        StoreProvider.state<CoreState>(context)!
            .navigationState!
            .secondaryActions;

    return ListView.builder(
        shrinkWrap: true,
        itemCount:
            _firstSearch ? widget.drawerItems.length : filterList!.length,
        itemBuilder: (BuildContext context, int index) {
          if (widget.favouriteDrawer) {
            final int navIndex = secondaryNavItemIndex!;
            if (navIndex > -1) {
              selectedindex = widget.drawerItems.indexWhere(
                  (NavigationItem navigationItem) =>
                      navigationItem.title ==
                      secondaryNavItem![navIndex].title);
            }
          } else {
            selectedindex = secondaryNavItemIndex;
          }

          final String title = (_firstSearch
              ? widget.drawerItems[index].title
              : filterList![index].title)!;
          final String iconUrl = (_firstSearch
              ? widget.drawerItems[index].icon!.iconUrl
              : filterList![index].icon!.iconUrl)!;
          final String? onTapRoute = _firstSearch
              ? widget.drawerItems[index].route
              : filterList![index].route;
          final List<NavigationNestedItem>? nestedItems = _firstSearch
              ? widget.drawerItems[index].nestedItems
              : filterList![index].nestedItems;
          final bool? isFavourite = _firstSearch
              ? widget.drawerItems[index].isFavourite
              : filterList![index].isFavourite;

          /// return [ListTile] if drawer does not have nested items
          if (nestedItems == null || nestedItems.isEmpty) {
            return StoreConnector<CoreState, VoidCallback>(
                converter: (Store<CoreState> store) {
              return () {
                store.dispatch(NavigationFavouriteAction(
                    context: context,
                    title: title,
                    flag: getFavouriteNavigationFlag(title),
                    navigationItem: widget.drawerItems[index]));
              };
            }, builder: (BuildContext context, VoidCallback callback) {
              return Slidable(
                actionPane: const SlidableDrawerActionPane(),
                actions: <Widget>[
                  IconSlideAction(
                    caption: navDrawerFavoritesText,
                    color: primaryColorLight,
                    icon: getIcon(
                        condition: isFavourite!,
                        conditionFlag: StoreProvider.state<CoreState>(context)!
                            .wait!
                            .isWaitingFor(getFavouriteNavigationFlag(title))),
                    onTap: callback,
                  ),
                ],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: number15),
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(number10)),
                    child: ListTileTheme(
                      textColor: Colors.white,
                      child: ListTile(
                          title: Row(
                            children: <Widget>[
                              CachedNetworkImage(
                                imageUrl: iconUrl,
                                color: Colors.white70,
                                height: 25,
                                width: 25,
                                placeholder:
                                    (BuildContext context, String url) => Icon(
                                        Icons.circle,
                                        color: Colors.grey.withOpacity(0.6),
                                        size: 25),
                              ),
                              mediumHorizontalSizedBox,
                              Text(title),
                            ],
                          ),
                          tileColor: (selectedindex == index)
                              ? primaryColorLight
                              : Colors.transparent,
                          onTap: () {
                            if (widget.favouriteDrawer) {
                              selectedindex = secondaryNavItem!.indexWhere(
                                  (NavigationItem navigationItem) =>
                                      navigationItem.title ==
                                      widget.drawerItems[index].title);

                              StoreProvider.dispatch<CoreState>(
                                context,
                                NavigationAction(
                                  drawerSelectedIndex: selectedindex,
                                ),
                              );
                            } else {
                              StoreProvider.dispatch<CoreState>(
                                context,
                                NavigationAction(
                                  drawerSelectedIndex: index,
                                ),
                              );
                            }

                            if (onTapRoute != null && onTapRoute.isNotEmpty) {
                              setState(() {});
                              Navigator.of(context)
                                  .pushReplacementNamed(onTapRoute);
                            } else {
                              Navigator.pushNamed(context, comingSoon,
                                  arguments: title);
                            }
                          }),
                    ),
                  ),
                ),
              );
            });
          }

          /// else return nested items in [ExpansionTile]
          return StoreConnector<CoreState, VoidCallback>(
            converter: (Store<CoreState> store) {
              return () {
                store.dispatch(NavigationFavouriteAction(
                    context: context,
                    title: title,
                    flag: getFavouriteNavigationFlag(title),
                    navigationItem: widget.drawerItems[index]));
              };
            },
            builder: (BuildContext context, VoidCallback callback) {
              return Slidable(
                  actionPane: const SlidableDrawerActionPane(),
                  actions: <Widget>[
                    IconSlideAction(
                      caption: navDrawerFavoritesText,
                      color: primaryColorLight,
                      icon: getIcon(
                        condition: isFavourite!,
                        conditionFlag: StoreProvider.state<CoreState>(context)!
                            .wait!
                            .isWaitingFor(
                              getFavouriteNavigationFlag(title),
                            ),
                      ),
                      onTap: callback,
                    ),
                  ],
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: number15),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(number10)),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            collapsedBackgroundColor: (selectedindex == index)
                                ? primaryColorLight
                                : Colors.transparent,
                            title: Row(
                              children: <Widget>[
                                CachedNetworkImage(
                                  imageUrl: iconUrl,
                                  color: Colors.white70,
                                  height: 25,
                                  width: 25,
                                  placeholder: (BuildContext context,
                                          String url) =>
                                      Icon(Icons.circle,
                                          color: Colors.grey.withOpacity(0.6),
                                          size: 25),
                                ),
                                mediumHorizontalSizedBox,
                                Text(title),
                              ],
                            ),
                            trailing: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white70,
                            ),
                            textColor: Colors.white,
                            collapsedTextColor: Colors.white,
                            backgroundColor: Colors.transparent,
                            children: <Widget>[
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: nestedItems.length,
                                  itemBuilder:
                                      (BuildContext context, int expandeIndex) {
                                    final String nestedTitle =
                                        nestedItems[expandeIndex].title!;
                                    final String? nestedOnTapRoute =
                                        nestedItems[expandeIndex].route;

                                    return IntrinsicHeight(
                                      child: Row(
                                        children: <Widget>[
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 0, 10, 0),
                                            child: VerticalDivider(
                                              color: Colors.white70,
                                              thickness: 1,
                                            ),
                                          ),
                                          Expanded(
                                            child: ListTileTheme(
                                              textColor: Colors.white,
                                              child: ListTile(
                                                title: Text(
                                                  nestedTitle,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                onTap: () {
                                                  if (widget.favouriteDrawer) {
                                                    selectedindex = secondaryNavItem!
                                                        .indexWhere((NavigationItem
                                                                navigationItem) =>
                                                            navigationItem
                                                                .title ==
                                                            widget
                                                                .drawerItems[
                                                                    index]
                                                                .title);

                                                    StoreProvider.dispatch<
                                                        CoreState>(
                                                      context,
                                                      NavigationAction(
                                                        drawerSelectedIndex:
                                                            selectedindex,
                                                      ),
                                                    );
                                                  } else {
                                                    StoreProvider.dispatch<
                                                        CoreState>(
                                                      context,
                                                      NavigationAction(
                                                        drawerSelectedIndex:
                                                            index,
                                                      ),
                                                    );
                                                  }

                                                  if (nestedOnTapRoute !=
                                                          null &&
                                                      nestedOnTapRoute
                                                          .isNotEmpty) {
                                                    setState(() {});
                                                    Navigator.of(context)
                                                        .pushReplacementNamed(
                                                            nestedOnTapRoute);
                                                  } else {
                                                    Navigator.pushNamed(
                                                        context, comingSoon,
                                                        arguments: title);
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  })
                            ],
                          ),
                        ),
                      )));
            },
          );
        });
  }

  Column _noElements() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          favouriteHelpIconUrl,
          height: 50,
        ),
        smallVerticalSizedBox,
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            navDrawerHowToFavouriteText,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  // Perform actual search
  Widget _performSearch() {
    filterList = widget.drawerItems
        .where((NavigationItem e) =>
            e.title!.toLowerCase().contains(_query.toLowerCase()))
        .toList();
    return _createListView();
  }
}
