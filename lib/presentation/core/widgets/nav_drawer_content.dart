import 'package:async_redux/async_redux.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:bewell_pro_core/application/core/theme/colors.dart';
import 'package:bewell_pro_core/application/redux/actions/navigation_actions/navigation_action.dart';
import 'package:bewell_pro_core/application/redux/states/core_state.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:bewell_pro_core/domain/core/value_objects/numbers_constants.dart';
import 'package:bewell_pro_core/presentation/router/routes.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/inputs.dart';

class NavDrawerContent extends StatefulWidget {
  const NavDrawerContent({
    Key? key,
    required this.drawerItems,
  }) : super(key: key);

  final List<NavigationItem> drawerItems;

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
                ),
                customFillColor: patientSearchInputFillColor.withOpacity(0.1),
                textInputAction: TextInputAction.search,
                isSearchFieldSmall: true,
                keyboardType: TextInputType.text,
                hintText: navDrawerHintSearchText,
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
  }

  ListView _createListView() {
    final int? selectedindex = StoreProvider.state<CoreState>(context)!
        .navigationState
        ?.drawerSelectedIndex;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: _firstSearch ? widget.drawerItems.length : filterList!.length,
      itemBuilder: (BuildContext context, int index) {
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

        /// return [ListTile] if drawer does not have nested items
        if (nestedItems == null || nestedItems.isEmpty) {
          return Slidable(
            actionPane: const SlidableDrawerActionPane(),
            actions: <Widget>[
              IconSlideAction(
                caption: navDrawerFavoritesText,
                color: healthcloudPrimaryColor,
                icon: Icons.star_border,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(snackbar(
                      content:
                          '$navDrawerFavoritesText $navDrawerComingSoonText'));
                },
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: number15),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(number10)),
                child: ListTile(
                    title: Text(title),
                    tileColor: (selectedindex == index)
                        ? Colors.purple[50]
                        : Colors.transparent,
                    leading: CachedNetworkImage(
                      imageUrl: iconUrl,
                      color: Colors.black45,
                      height: 25,
                      width: 25,
                      placeholder: (BuildContext context, String url) =>
                          const Icon(Icons.cloud_off),
                    ),
                    onTap: () {
                      StoreProvider.dispatch<CoreState>(
                        context,
                        NavigationAction(
                          drawerSelectedIndex: index,
                        ),
                      );
                      if (onTapRoute != null && onTapRoute.isNotEmpty) {
                        setState(() {});
                        Navigator.of(context).pushReplacementNamed(onTapRoute);
                      }
                    }),
              ),
            ),
          );
        }

        /// else return nested items in [ExpansionTile]
        return Slidable(
            actionPane: const SlidableDrawerActionPane(),
            actions: <Widget>[
              IconSlideAction(
                caption: navDrawerFavoritesText,
                color: healthcloudPrimaryColor,
                icon: Icons.star_border,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(snackbar(
                      content:
                          '$navDrawerFavoritesText $navDrawerComingSoonText'));
                },
              ),
            ],
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: number15),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(number10)),
                  child: ExpansionTile(
                    collapsedBackgroundColor: (selectedindex == index)
                        ? Colors.purple[50]
                        : Colors.transparent,
                    title: Text(title),
                    leading: CachedNetworkImage(
                      imageUrl: iconUrl,
                      color: Colors.black45,
                      height: 25,
                      width: 25,
                      placeholder: (BuildContext context, String url) =>
                          const Icon(Icons.cloud_off),
                    ),
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

                            return ListTile(
                              title: Text(nestedTitle),
                              onTap: () {
                                StoreProvider.dispatch<CoreState>(
                                  context,
                                  NavigationAction(
                                    drawerSelectedIndex: index,
                                  ),
                                );
                                if (nestedOnTapRoute != null &&
                                    nestedOnTapRoute.isNotEmpty) {
                                  setState(() {});
                                  Navigator.of(context)
                                      .pushReplacementNamed(nestedOnTapRoute);
                                } else {
                                  Navigator.pushNamed(context, comingSoon,
                                      arguments: title);
                                }
                              },
                            );
                          })
                    ],
                  ),
                )));
      },
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
