class EntitiesController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = current_user.groups.find(params[:group_id])
    @entities = @groups.entities
  end

  def new
    @group = current_user.groups.find(params[:group_id])
    @entity = @group.entities.new
  end

  def create
    @group = current_user.groups.find(params[:group_id])
    @entity = current_user.entities.create(entity_params)

    if @entity.save

      @group_entity = @entity.group_entities.create(group_id: @group.id, entity_id: @entity.id)

      if @group_entity.save
        flash[:notice] = 'Transaction categoriy was successfully created.'
        redirect_to group_entities_path(@group)
      else
        flash[:alert] = 'An error occured and transaction categoriy was not created!'
        render action: 'new'
      end

    else
      flash[:alert] = 'An error occured and transaction was not created!'
      render action: 'new'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
