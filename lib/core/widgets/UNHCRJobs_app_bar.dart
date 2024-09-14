import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unhcr_jobs_app/core/constant/constants.dart';

class UNHCRJobsAppBar extends StatefulWidget implements PreferredSizeWidget {
  const UNHCRJobsAppBar({
    required this.title,
    this.showBackButton = false,
    this.onSearchChanged,
    super.key,
  });

  final bool showBackButton;
  final String title;
  final Function(String)? onSearchChanged;

  @override
  _UNHCRJobsAppBarState createState() => _UNHCRJobsAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(AppConstants.appBarHeight);
}

class _UNHCRJobsAppBarState extends State<UNHCRJobsAppBar>
    with SingleTickerProviderStateMixin {
  bool _isSearchActive = false;
  final TextEditingController _searchController = TextEditingController();

  // Animation Controller for smooth transitions
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _searchController.addListener(_onSearchTextChanged);
  }

  void _onSearchTextChanged() {
    if (widget.onSearchChanged != null) {
      widget.onSearchChanged!(_searchController.text);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearchActive = !_isSearchActive;
      if (_isSearchActive) {
        _animationController.forward();
      } else {
        _animationController.reverse();
        _searchController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.showBackButton
          ? Center(
              child: IconButton(
                onPressed: () => context.router.popForced(),
                icon: const Icon(
                  CupertinoIcons.chevron_back,
                  size: 24,
                ),
              ),
            )
          : null,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0,
      centerTitle: widget.showBackButton,
      automaticallyImplyLeading: false,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Row(
              children: [
                if (!_isSearchActive)
                  Expanded(
                    child: Text(
                      widget.title,
                    ),
                  ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _isSearchActive ? 200 : 0, // Animate width
                  child: _isSearchActive
                      ? TextField(
                          controller: _searchController,
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: "Search...",
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                          onSubmitted: (value) {
                            // Handle search logic here
                          },
                        )
                      : null,
                ),
              ],
            );
          },
        ),
      ),
      actions: [
        if (widget.onSearchChanged != null)
          Center(
            child: IconButton(
              onPressed: _toggleSearch,
              icon: Icon(
                _isSearchActive ? CupertinoIcons.xmark : CupertinoIcons.search,
              ),
            ),
          ),
      ],
    );
  }
}
