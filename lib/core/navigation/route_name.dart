class RouteName {
  RouteName._();

  static const String prayerTimeScreen = '/prayer_times_screen';
  static const String athkarScreen = 'athkar_screen';
  static const String athkarChapterScreen = 'chapter';
  static const String athkarCategoryScreen = '/athkar_category_screen';
  static const String qiblahScreen = '/qiblah_screen';
  static const String allahNamesScreen = '/allah_names_screen';

  static String toChapterScreenPath(int categoryId) =>
      '$athkarCategoryScreen/$athkarChapterScreen/$categoryId';

  static String toItemScreenPath(int categoryId, int chapterId) =>
      '$athkarCategoryScreen/$athkarChapterScreen/$categoryId/$athkarScreen/$chapterId';
}
