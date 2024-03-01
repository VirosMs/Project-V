/// SelectionPopupModel is a common model used for setting data into dropdowns.
class SelectionPopupModel {
  int? id;
  String title;
  dynamic value;
  bool isSelected;

  /// Constructs a new instance of [SelectionPopupModel].
  ///
  /// The [id] is an optional parameter representing the unique identifier of the model.
  /// The [title] is a required parameter representing the title of the model.
  /// The [value] is an optional parameter representing the value associated with the model.
  /// The [isSelected] is an optional parameter indicating whether the model is selected or not.
  SelectionPopupModel({
    this.id,
    required this.title,
    this.value,
    this.isSelected = false,
  });
}
