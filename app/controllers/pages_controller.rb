class PagesController < ApplicationController
  def redirect
    path = case current_user.role
           when 'employee'
             employee_path
           when 'manager'
             manager_path
           end

    redirect_to(path)
  end
end
