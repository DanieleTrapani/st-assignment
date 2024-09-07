class TasksController < ApplicationController
  def employee
    redirect_to(root_path) if current_user.role != 'employee'
  end

  def manager
    redirect_to(root_path) if current_user.role != 'manager'
    @entries = Entry.all.order(approved: :asc)
  end

  def approve
    raise
    entry = Entry.find(params[:id])
    entry.update(approved: true)
    entry.save
    redirect_to(manager_tasks_path)
  end

  def reject
    entry = Entry.find(params[:id])
    entry.update(approved: false)
    entry.save
    redirect_to(manager_tasks_path)
  end
end
