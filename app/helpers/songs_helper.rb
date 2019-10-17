module SongsHelper
  
  def new_sort_order
    return session[:current_sort_order] == 'asc' ? 'desc' : 'asc'
  end
  
  def sort_button_display(label,field)
    current_field = session[:current_sort_field]==field
    current_field_class = current_field ? "col-selected" : ""
   
    sort_class = current_field ? (session[:current_sort_order]=="asc" ? 'sort-asc' : 'sort-desc') : ""
    link_to(label, 
      "#{request.url}&#{{sort: {by: field, direction: new_sort_order}}.to_param}", 
      id: "sort_button",
      class: "#{current_field_class} #{sort_class}",
      remote: true )
  end
end
