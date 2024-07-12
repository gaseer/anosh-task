import 'package:anosh/bloc/item_bloc.dart';
import 'package:anosh/bloc/item_state.dart';
import 'package:anosh/models/item_model.dart';
import 'package:anosh/constants.dart';
import 'package:anosh/screens/mainScreen_tabView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/item_event.dart';

class HomeScreen extends StatefulWidget {
  final Item? item;
  const HomeScreen({super.key, this.item});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return BlocBuilder<ItemBloc, ItemState>(builder: (context, state) {
      if (state.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.error != null) {
        return Center(child: Text('Error: ${state.error}'));
      } else {
        return Scaffold(
            key: _scaffoldState,
            drawer: drawerSection(w, state, context),
            body: bodySection(w, h, state));
      }
    });
  }

  Drawer drawerSection(double w, ItemState state, BuildContext context) {
    return Drawer(
      width: w * .125,
      backgroundColor: Colors.white10,
      child: ListView(
        children: [
          SizedBox(
            height: w * .05,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black87,
              ),
              child: Text(
                'Barcodes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: w * .015,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ...state.items.map((item) => ListTile(
                title: Text(
                  item.barcode.toString(),
                  style: customTextStyle,
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  context.read<ItemBloc>().add(SelectItem(item));
                  Navigator.pop(context);
                },
              )),
        ],
      ),
    );
  }

  Container bodySection(double w, double h, ItemState state) {
    return Container(
      width: w,
      height: h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/BG.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              _scaffoldState.currentState?.openDrawer();
            },
            child: SizedBox(
              height: h * 0.05,
              child: Padding(
                padding: EdgeInsets.fromLTRB(w * 0.008, 0, 0, 0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Icon(
                    CupertinoIcons.line_horizontal_3,
                    size: h * 0.04,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: w * .01),
          TabBar(
            indicatorColor: Colors.transparent,
            controller: _tabController,
            dividerHeight: .05,
            dividerColor: Colors.white10,
            tabs: [
              SizedBox(
                height: h * 0.07,
                width: w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                  child: Row(
                    children: [
                      Container(
                        height: h * 0.055,
                        width: w * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(h * 0.02),
                        ),
                        child: Center(
                          child: Text(
                            'Details',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: w * 0.01,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            indent: w * 0.06,
            endIndent: w * 0.06,
            color: Colors.white,
            thickness: h * 0.0005,
            height: h * .025,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                MainScreenTabView(
                  h: h,
                  w: w,
                  state: state,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
