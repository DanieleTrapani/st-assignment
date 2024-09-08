class EntriesController < ApplicationController
  def employee
    redirect_to(root_path) if current_user.role != 'employee'
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user

    if @entry.save
      redirect_to(employee_entries_path)
    else
      render(:employee, status: :unprocessable_entity)
    end
  end

  def manager
    redirect_to(root_path) if current_user.role != 'manager'
    @entries = Entry.all.order(approved: :desc, created_at: :desc)
  end

  def approve
    entry = Entry.find(params[:id])
    entry.approved = true
    entry.save
    redirect_to(manager_entries_path)
  end

  def reject
    entry = Entry.find(params[:id])
    entry.approved = false
    entry.save
    redirect_to(manager_entries_path)
  end

  private

  def entry_params
    params.require(:entry).permit(:company, :kwh, :startdate, :enddate)
  end
end
