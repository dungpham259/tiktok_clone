enum AppBottomSheetType {
  flexContent,
  listView,
  draggableScroll,
}

extension AppBottomSheetTypeX on AppBottomSheetType {
  bool get isFlexContent => this == AppBottomSheetType.flexContent;
  bool get isListView => this == AppBottomSheetType.listView;
  bool get isDraggableScroll => this == AppBottomSheetType.draggableScroll;
}
