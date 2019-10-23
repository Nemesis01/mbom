import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbom/custom/custom_bottom_navigation_bar.dart';
import 'package:mbom/custom/custom_search_bar.dart';
import 'package:mbom/models/user.dart';
import 'package:mbom/pages/page_home.dart';
import 'package:mbom/pages/page_smartphones.dart';
import 'package:mbom/pages/page_tablets.dart';
import 'package:mbom/views/view_filter_side_sheet.dart';
import 'package:mbom/views/view_menu.dart';

//TODO: move to bloc declaration
const double _flingVelocity = 2.0;
final User user = User(
  name: 'Calamity Jane',
  contact: '+122233344',
  email: 'calamity.jane@western.us',
);

class HomeScreen extends StatefulWidget {
  //region Members
  //final ThemeData theme;

  //endregion

  //region Constructor(s)
  //HomeScreen({this.user})
  //endregion

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //region fields
  AnimationController controller;
  Menu currentMenu = Menu.Home;
  Widget currentPage = HomePage();
  int currentPageIndex = 0;
  int currentBottomMenuIndex = 0;
  String title;

  // FrontLayer pages
  List<Widget> pages = [
    HomePage(),
    SmartphonesPage(),
    TabletsPage(),
  ];

  //final mediaQuery = MediaQuery.of(context);
  //endregion

  //region Getters and Setters
  bool get _isFrontLayerVisible {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }
  //endregion

  //region LifeCycle Methods
  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      vsync: this,
      value: 1.0,
      duration: Duration(milliseconds: 2000),
    );
    title = describeEnum(currentMenu);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  //endregion

  //region UI Methods
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    //Change status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 100, 35, 110),
      statusBarIconBrightness: Brightness.dark,
    ));

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: width < 600 ? _buildAppBar(context) : null, //null
      body: _buildBody(context),
      bottomNavigationBar:
          width < 600 ? _buildBottomNavigationBar(context) : null,
      floatingActionButton: FloatingActionButton(
        //elevation: 8.0,
        child: Icon(LineIcons.search),
        onPressed: () {},
        //TODO: hardcoded String value
        tooltip: 'search',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _landscape(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            //TODO: Hardcoded value, create an entry in the dimens file
            width: 256.0, //276.0
            child: MenuPage(
              type: MenuPageType.Extended,
              currentMenu: currentMenu,
              onMenuSelected: (menu) => _onMenuSelected(menu),
              onLinkClicked: _onLinkClicked,
            ),
          ),
          Flexible(
            //flex: 10,
            child: Material(
              elevation: 0.0,
              child: Column(
                children: <Widget>[
                  PreferredSize(
                      child: Container(
                        //TODO: hardcoded double value
                        height: 40.0,
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            BackButton(),
                            Text(
                              'AppBar',
                              style: Theme.of(context)
                                  .textTheme
                                  .title
                                  .copyWith(color: Colors.deepPurple),
                            ),
                            //TODO: Create searchBar widget
                            Expanded(
                              child: CustomSearchBar(),
                            ),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(LineIcons.filter),
                                  onPressed: () {},
                                  iconSize: 20.0,
                                  color: Colors.deepPurple,
                                  //TODO: hardcoded String value
                                  tooltip: 'Filter',
                                ),
                                IconButton(
                                  icon: Icon(LineIcons.sort_amount_asc),
                                  onPressed: () {},
                                  iconSize: 20.0,
                                  color: Colors.deepPurple,
                                  //TODO: hardcoded String value
                                  tooltip: 'Sort',
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      preferredSize: Size(null, null)),
                  HomePage(),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 0,
            child: Container(
              margin: EdgeInsets.only(left: 2.0),
              width: 236.0,
              color: Colors.grey,
              child: FilterSideSheet(),
            ),
          )
        ],
      ),
    );
  }

  //TODO: Create String entries for hardcoded string values
  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      //backgroundColor: Theme.of(context).accentColor.withOpacity(0.12),
      //backgroundColor: Colors.grey.shade50,
      elevation: 0.0,
      brightness: Brightness.light,
      leading: Padding(
        padding: EdgeInsets.only(left: 0.0),
        child: IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: controller.view,
            //color: Theme.of(context).accentColor,
          ),
          onPressed: _toggleBackdropLayerVisibility,
          tooltip: _isFrontLayerVisible == true ? 'menu' : 'close',
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: Text(title),
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(LineIcons.filter),
            iconSize: 28.0,
            onPressed: () {},
            tooltip: 'Filter'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: IconButton(
            icon: Icon(LineIcons.shopping_cart),
            iconSize: 28.0,
            onPressed: () {},
            tooltip: 'Cart',
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SafeArea(
      top: true,
      bottom: true,
      child: Container(
        //child: LayoutBuilder(builder: _buildStack),
        child: width < 600
            ? LayoutBuilder(builder: _buildStack)
            : _landscape(context),
      ),
    );
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;

    //TODO: replace hardcoded double value 54.0 by appBarHeight
    final Size layerSize = constraints.biggest;
    final double layerTop = layerSize.height - 54.0;

    final double layerLeft = layerSize.width - 256.0;

    Animation<RelativeRect> layerAnimation = width < 600
        ? RelativeRectTween(
            begin: RelativeRect.fromLTRB(
                0.0, layerTop, 0.0, layerTop - layerSize.height),
            end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0), //-54.0
          ).animate(controller.view)
        : RelativeRectTween(
            begin: RelativeRect.fromLTRB(256.0, 0.0, 0.0, 0.0),
            end: RelativeRect.fromLTRB(68.0, 0.0, 0.0, 0.0), //-54.0
          ).animate(controller.view);

    return width < 600
        ? Stack(
            children: <Widget>[
              ExcludeSemantics(
                child: MenuPage(
                  type: MenuPageType.Modal,
                  currentMenu: currentMenu,
                  onMenuSelected: (menu) => _onMenuSelected(menu),
                  onLinkClicked: _onLinkClicked,
                ),
                excluding: _isFrontLayerVisible,
              ),
              PositionedTransition(
                rect: layerAnimation,
                child: _FrontLayer(
                  isVisible: !_isFrontLayerVisible,
                  onTap: _toggleBackdropLayerVisibility,
                  child: pages[currentPageIndex],
                ),
              ),
            ],
          )
        : Stack(
            children: <Widget>[
              ExcludeSemantics(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 266.0,
                      child: MenuPage(
                        type: MenuPageType.Extended,
                        currentMenu: currentMenu,
                        onMenuSelected: (menu) => _onMenuSelected(menu),
                        onLinkClicked: _onLinkClicked,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                excluding: _isFrontLayerVisible,
              ),
              PositionedTransition(
                rect: layerAnimation,
                child: _FrontLayer(
                  isVisible: !_isFrontLayerVisible,
                  onTap: _toggleBackdropLayerVisibility,
                  child: pages[currentPageIndex],
                ),
              ),
            ],
          );
  }

  //TODO: implements bottomNavigationBar animation in order to hide her when the the menu layer is visible

  _buildBottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      elevation: 16.0,
      shape: CircularNotchedRectangle(),
      child: CustomBottomNavigationBar(
        currentIndex: currentBottomMenuIndex,
        items: [
          CustomBottomNavigationBarItem(icon: LineIcons.home),
          CustomBottomNavigationBarItem(icon: LineIcons.envelope_o),
          CustomBottomNavigationBarItem(icon: LineIcons.shopping_cart),
          CustomBottomNavigationBarItem(icon: LineIcons.user),
        ],
        //TODO: Move handleTap method to bloc declaration
        onTap: (index) => _onBottomNavItemTap(index),
      ),
    );
  }
  //endregion

  //region Other Methods
  void _toggleBackdropLayerVisibility() {
    controller.fling(
        velocity: _isFrontLayerVisible ? -_flingVelocity : _flingVelocity);
  }

  void _toggleBottomAppBarVisibilty() {}

  void _onMenuSelected(Menu menu) {
    setState(() {
      currentMenu = menu;
      title = describeEnum(menu).contains('_')
          ? describeEnum(menu).replaceFirst('_', ' ')
          : describeEnum(menu);
      // Swicthes page if it needed
      if (menu == Menu.Home) _switchPage(0);
      if (menu == Menu.Smartphones) _switchPage(1);
      if (menu == Menu.Tablets) _switchPage(2);
      //if (menu == Menu.Accessories) _switchPage(3);
    });

    _toggleBackdropLayerVisibility();
  }

  void _onBottomNavItemTap(int index) {
    setState(() {
      currentBottomMenuIndex = index;
      print('Current Bottom Navigation Bar Index : $currentBottomMenuIndex');
    });
  }

  void _onLinkClicked() {
    //TODO: pass current in argument or create global variable user
    Navigator.of(context).pushNamed('/profile');
  }

  void _switchPage(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }
  //endregion

}

class _FrontLayer extends StatelessWidget {
  //region Field(s)
  final Widget child;
  final bool isVisible;
  final VoidCallback onTap;
  //endregion

  //region Constructor(s)
  _FrontLayer({
    Key key,
    this.child,
    this.isVisible,
    this.onTap,
  }) : super(key: key);
  //endregion

  @override
  Widget build(BuildContext context) {
    return Material(
      //TODO: make mediaQuery global
      color: Colors.white,
      elevation: MediaQuery.of(context).size.width < 600 ? 0.0 : 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          // topRight: Radius.circular(24.0),
        ),
      ),
      child: CupertinoScrollbar(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              child: Visibility(
                visible: isVisible,
                child: Container(
                  height: 40.0,
                  child: Center(
                    child: Container(
                      height: 4.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(8.0)),
                      //child: SizedBox(Height),
                    ),
                  ),
                ),
              ),
              onTap: onTap,
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
