class GroupController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    if user_signed_in?
      @groups = current_user.groups
    else
      render 'users/splash'
    end
  end

  def new
    @group = current_user.groups.new
  end

  def create
    @user = current_user
    @group = @user.groups.create(group_params)
    if @group.save
      flash[:notice] = 'New category created successfully'
      redirect_to group_index_path
    else
      flash.now[:alert] = 'Category creation failed'
      render action: 'new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
