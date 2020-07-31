import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/setting.dart';

class SettingsScreen extends StatefulWidget {
  final Setting filter;
  final Function(Setting) onChangedSettings;

  const SettingsScreen(this.filter, this.onChangedSettings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Setting filter;

  @override
  void initState() {
    super.initState();
    filter = widget.filter;
  }

  Widget _createSwitch(
    String title,
    String subTitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onChangedSettings(filter);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurations'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Filters',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Without gluten',
                  'Only displays gluten-free meals.',
                  filter.isGlutenFree,
                  (value) => {
                    setState(() {
                      filter.isGlutenFree = value;
                    })
                  },
                ),
                _createSwitch(
                  'Lactose free',
                  'Only displays meals without lactose.',
                  filter.isLactoseFree,
                  (value) => {
                    setState(() {
                      filter.isLactoseFree = value;
                    })
                  },
                ),
                _createSwitch(
                  'Vegetarian',
                  'Only display meals vegetarians.',
                  filter.isVegetarian,
                  (value) => {
                    setState(() {
                      filter.isVegetarian = value;
                    })
                  },
                ),
                _createSwitch(
                  'Vegan',
                  'Only display meals vegans',
                  filter.isVegan,
                  (value) => {
                    setState(() {
                      filter.isVegan = value;
                    })
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
