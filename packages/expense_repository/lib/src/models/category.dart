import 'package:expense_repository/src/entities/category_entity.dart';

class Category {
  String categoryId;
  String name;
  int totalExpenses;
  String icon;
  String colors;

  Category({
    required this.categoryId,
    required this.name,
    required this.totalExpenses,
    required this.icon,
    required this.colors,
  });

  static final empty = Category(
    categoryId: "",
    name: "",
    totalExpenses: 0,
    icon: "",
    colors: "",
  );
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      totalExpenses: totalExpenses,
      icon: icon,
      colors: colors,
    );
  }

  static Category fromEntity(CategoryEntity entity) {
    return Category(
      categoryId: entity.categoryId,
      name: entity.name,
      totalExpenses: entity.totalExpenses,
      icon: entity.icon,
      colors: entity.colors,
    );
  }
}
