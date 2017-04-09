module ExpensesHelper
  # Method for know if a type was clicked (active)
  def type_active(type)
    params[:type] == type
  end

  # In view has to look like href="/expenses?type=xxxxxx
  def link_to_type(type)
    # Search for the type selected if it does not have the class active
    path = expenses_path(request.query_parameters.merge(type: type))
    # If the type has the active class, it removes it and return the list to default state
    path = expenses_path(request.query_parameters.except(:type)) if type_active(type)
    
    link_to type.capitalize, path, class: "list-group-item #{'active' if type_active(type) }"
  end

  #  Method for know if a category was clicked (active)
  def category_active(category)
    params[:category_id] == category.id.to_s
  end

  # In view has to look like if is not active href="/expenses?category_id=xx"
  def link_to_category(category)
    # Search for the category selected if it does not have the class active
    path = expenses_path(request.query_parameters.merge(category_id: category.id))
     # If the category has the active class, it removes it and return the list to default state
    path = expenses_path(request.query_parameters.except(:category_id)) if category_active(category)
    
    link_to category.name, path, class: "list-group-item #{'active' if category_active(category) }"
  end 
end
