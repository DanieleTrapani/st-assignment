class PagesController < ApplicationController
  def redirect
    path = case current_user.role
           when 'employee'
             employee_tasks_path
           when 'manager'
             manager_tasks_path
           end

    redirect_to(path)
  end
end
