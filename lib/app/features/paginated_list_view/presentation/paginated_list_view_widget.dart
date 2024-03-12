import 'package:flutter/material.dart';
import 'package:pokedex_app/app/core/design/decorations/input_decorations.dart';
import 'package:pokedex_app/app/core/design/res/app_colors.dart';
import 'package:pokedex_app/app/core/design/res/dimen.dart';
import 'package:pokedex_app/app/core/shared/presentation/ui_state.dart';
import 'package:pokedex_app/app/features/paginated_list_view/data/pagination.dart';
import 'package:pokedex_app/app/features/paginated_list_view/presentation/widgets/centered_progress_indicator.dart';

class PaginatedListViewWidget<T> extends StatefulWidget {
  final bool? shrinkWrap;
  final ScrollPhysics? physics;
  final bool isLoading;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onLoadMorePressed;
  final Success<Pagination<T>> paginationState;
  final Function(T item) builder;

  const PaginatedListViewWidget({
    Key? key,
    this.shrinkWrap,
    this.physics,
    this.padding,
    required this.isLoading,
    this.onLoadMorePressed,
    required this.paginationState,
    required this.builder,
    this.controller,
  }) : super(key: key);

  @override
  State<PaginatedListViewWidget<T>> createState() =>
      _PaginatedListViewWidgetState<T>();
}

class _PaginatedListViewWidgetState<T>
    extends State<PaginatedListViewWidget<T>> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 5.0);
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  bool get _loadingMoreItens =>
      _scrollController.offset >= _scrollController.position.maxScrollExtent &&
      !_scrollController.position.outOfRange &&
      !widget.isLoading;

  void _scrollListener() {
    if (_loadingMoreItens) {
      widget.onLoadMorePressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final pagination = widget.paginationState.value;

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(PokedexDimen.large),
          sliver: SliverGrid(
            gridDelegate: PokedexDecorations.gridDelegate,
            delegate: SliverChildBuilderDelegate(
              (_, index) {
                return widget.builder(pagination.currentList[index]);
              },
              childCount: pagination.numOfResults,
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Visibility(
            visible: widget.isLoading,
            child: const CenteredProgressIndicator(
              color: AppColors.redPokedexColor,
            ),
          ),
        ),
      ],
    );
  }
}
