class PagesController < ApplicationController
  def redirect
    path = case current_user.role
           when 'employee'
             employee_entries_path
           when 'manager'
             manager_entries_path
           end

    redirect_to(path)
  end
end
