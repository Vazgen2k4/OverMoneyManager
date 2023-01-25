import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:over_money_manager/app_const.dart';
import 'package:over_money_manager/domain/api/firebase_api.dart';
import 'package:over_money_manager/domain/logic/gsheets/gsheets_bloc.dart';
import 'package:over_money_manager/generated/l10n.dart';
import 'package:over_money_manager/resources/resources.dart';
import 'package:over_money_manager/ui/theme/app_colors.dart';
import 'package:over_money_manager/ui/widgets/custom_appbar/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _curentPageIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: _curentPageIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _localization = S.of(context);
    final _textTheme = Theme.of(context).textTheme;

    final _navigationData = <NavigationWigetData>[
      NavigationWigetData(
        activeIcon: Icons.home_rounded,
        disableIcon: Icons.home_outlined,
        label: 'Home',
        content: Container(
          alignment: Alignment.center,
          child: BlocBuilder<GsheetsBloc, GsheetsState>(
            builder: (context, state) {
              return Container();
            },
          ),
        ),
      ),
      NavigationWigetData(
        activeIcon: Icons.stacked_bar_chart_rounded,
        disableIcon: Icons.stacked_bar_chart_outlined,
        label: 'Statistic',
        content: Container(child: Text('Statistic')),
      ),
      NavigationWigetData(
        activeIcon: Icons.history_rounded,
        disableIcon: Icons.history_outlined,
        label: 'History',
        content: Container(child: Text('History')),
      ),
      NavigationWigetData(
        activeIcon: Icons.settings_outlined,
        disableIcon: Icons.settings_rounded,
        label: 'Settings',
        content: Container(child: Text('Settings')),
      ),
    ];

    final _centerIndex = _navigationData.length ~/ 2;

    return Scaffold(
      appBar: CustomAppBar(
        height: 72,
        leading: SvgPicture.asset(AppIcons.logo),
        title: Text(
          'Money Manager',
          style: _textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
      body: PageView.builder(
        onPageChanged: (_curentIndex) {
          setState(() {
            _curentPageIndex = _curentIndex;
          });
        },
        controller: _pageController,
        itemCount: _navigationData.length,
        itemBuilder: (context, index) {
          return _navigationData[index].content;
        },
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _navigationData.map<Widget>((data) {
              return Expanded(
                child: NavigationButtunWiget(
                  onTap: () {
                    final _curentIndex = _navigationData.indexOf(data);
                    _pageController.jumpToPage(_curentIndex);
                    setState(() {
                      _curentPageIndex = _curentIndex;
                    });
                  },
                  isActive: _navigationData.indexOf(data) == _curentPageIndex,
                  data: data,
                ),
              );
            }).toList()
              ..insert(_centerIndex, const SizedBox(width: 50)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final user = await FirebaseApi.getUser();

          AppConstants.borderPrint(user);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class NavigationWigetData extends Equatable {
  final Widget content;
  final IconData activeIcon;
  final IconData disableIcon;
  final String label;

  const NavigationWigetData({
    required this.content,
    required this.label,
    required this.disableIcon,
    required this.activeIcon,
  });

  @override
  List<Object> get props => [label];
}

class NavigationButtunWiget extends StatelessWidget {
  final bool isActive;
  final NavigationWigetData data;
  final VoidCallback onTap;

  const NavigationButtunWiget({
    Key? key,
    required this.isActive,
    required this.data,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isActive ? null : onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isActive ? AppColors.background : Colors.transparent,
        ),
        side: MaterialStateProperty.all(BorderSide.none),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
        elevation: MaterialStateProperty.all(0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: isActive ? AppColors.akcent : Colors.transparent,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 2,
            ),
            child: Icon(
              isActive ? data.activeIcon : data.disableIcon,
              color: isActive ? AppColors.disabledText : AppColors.text,
              size: 20,
            ),
          ),
          Text(
            data.label,
            style: TextStyle(color: isActive ? null : AppColors.text),
          )
        ],
      ),
    );
  }
}
