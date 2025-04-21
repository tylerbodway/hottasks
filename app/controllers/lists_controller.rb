class ListsController < ApplicationController
  before_action :set_list, only: %w[show edit update]

  def index
    @lists = Current.user.lists
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = Current.user.lists.build(list_params)

    if @list.save
      redirect_to @list, notice: "List added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @list.assign_attributes(list_params)

    if @list.save
      redirect_to @list, notice: "List updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = Current.user.lists.find(params.expect(:id))
  end

  def list_params
    params.expect(list: %w[name description])
  end
end
