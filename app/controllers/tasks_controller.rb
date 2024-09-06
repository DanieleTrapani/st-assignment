class TasksController < ApplicationController
  def employee
    redirect_to(root_path) if current_user.role != 'employee'
  end

  def manager
    redirect_to(root_path) if current_user.role != 'manager'
  end
end
