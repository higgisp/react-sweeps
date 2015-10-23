class EntriesController < ApplicationController

  def index
    @entries = Entry.all.order(created_at: :desc)
    render json: @entries
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      render json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:first_name, :last_name, :email, :address, :city, :state, :zip, :opt_in)
  end
end
