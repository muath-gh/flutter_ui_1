import 'package:flutter/material.dart';

class CustomBottomNavBarItem {
  final IconData iconData;
  final String text;

  CustomBottomNavBarItem({this.iconData, this.text});
}

class CustomBottomNavBar extends StatefulWidget {
  final List<CustomBottomNavBarItem> items;
  final double height;
  final double iconSize;
  final Color selectedColor;
  final Color color;
  final double fontSize;
  final Color backgroundColor;
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
  CustomBottomNavBar(
      {this.items,
      this.height,
      this.iconSize,
      this.selectedColor,
      this.color,
      this.fontSize,
      this.backgroundColor});
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildTabItem({
    CustomBottomNavBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text,
                  style: TextStyle(color: color, fontSize: widget.fontSize),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return BottomAppBar(
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
      ),
    );
  }
}
