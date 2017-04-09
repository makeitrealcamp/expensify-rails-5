module ExpensesHelper
  # Method for know if a type was clicked (active)
  def type_active(type)
    params[:type] == type
  end

  # In view has to look href="/expenses?type=xxxxxx
  def link_to_type(type)
    # Search for the type selected if it does not have the class active
    path = expenses_path(request.query_parameters.merge(type: type))
    # If the type has the active class, it removes it and search without type
    path = expenses_path(request.query_parameters.except(:type)) if type_active(type)
    
    link_to type.capitalize, path, class: "list-group-item #{'active' if type_active(type) }"
  end
end
