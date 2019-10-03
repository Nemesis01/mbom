import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mbom/custom/custom_bottom_navigation_bar.dart';
import 'package:mbom/models/user.dart';
import 'package:mbom/pages/page_home.dart';
import 'package:mbom/views/view_menu.dart';

//TODO: move to bloc declaration
const double _flingVelocity = 2.0;
final User user = User(
  name: 'John Doe',
  contact: '+122233344',
  email: 'johndoe@mbom.xyz',
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
  int currentIndex = 0;
  String title;

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

    //double width = mediaQuery.size.width;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      floatingActionButton: FloatingActionButton(
        elevation: 4.0,
        child: Icon(LineIcons.search),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: Padding(
        padding: EdgeInsets.only(left: 0.0),
        child: IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: controller.view,
          ),
          onPressed: _toggleBackdropLayerVisibility,
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
        ),
        IconButton(
          icon: Icon(LineIcons.shopping_cart),
          iconSize: 28.0,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Container(
        child: LayoutBuilder(builder: _buildStack),
      ),
    );
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;

    //TODO: replace hardcoded double value 54.0 by appBarHeight
    final Size layerSize = constraints.biggest;
    final double layerTop = layerSize.height - 54.0;

    Animation<RelativeRect> layerAnimation = width < 600
        ? RelativeRectTween(
            begin: RelativeRect.fromLTRB(
                0.0, layerTop, 0.0, layerTop - layerSize.height),
            end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, -54.0),
          ).animate(controller.view)
        : RelativeRectTween(
            begin: RelativeRect.fromLTRB(
                200.0, layerTop + 54.0, 0.0, layerTop - layerSize.height),
            end: RelativeRect.fromLTRB(360.0, 0.0, 0.0, 0.0),
          ).animate(controller.view);

    return width < 600
        ? Stack(
            children: <Widget>[
              ExcludeSemantics(
                child: MenuPage(
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
                  child: HomePage(),
                ),
              ),
            ],
          )
        : Stack(
            children: <Widget>[
              ExcludeSemantics(
                child: Container(
                  width: 360.0,
                  child: MenuPage(
                    currentMenu: currentMenu,
                    onMenuSelected: (menu) => _onMenuSelected(menu),
                    onLinkClicked: _onLinkClicked,
                  ),
                ),
                excluding: _isFrontLayerVisible,
              ),
              PositionedTransition(
                rect: layerAnimation,
                child: _FrontLayer(
                  isVisible: !_isFrontLayerVisible,
                  onTap: _toggleBackdropLayerVisibility,
                  child: HomePage(),
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
        currentIndex: currentIndex,
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
    });

    _toggleBackdropLayerVisibility();
  }

  void _onBottomNavItemTap(int index) {
    setState(() {
      currentIndex = index;
      print('Current Bottom Navigation Bar Index : $currentIndex');
    });
  }

  void _onLinkClicked() {
    Navigator.of(context).pushNamed('/profile', arguments: user);
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
      elevation: 16.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          // topRight: Radius.circular(24.0),
        ),
      ),
      child: Column(
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
          child,
        ],
      ),
    );
  }
}
