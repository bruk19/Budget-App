class EntitiesController < ApplicationController
  before_action :authenticate_user!
  def index
    @group = current_user.groups.find(params[:group_id])
    @entities = @group.entities
  end

  def new
    @group = current_user.groups.find(params[:group_id])
    @entity = @group.entities.new
  end

  def create
    @group = current_user.groups.find(params[:group_id])
    @entity = current_user.entities.create(entity_params)
    puts @entity
    if @entity.save
      @group_entity = @entity.group_entities.create(group_id: @group.id, entity_id: @entity.id)
      if @group_entity.save
        flash[:notice] = 'Transaction created successfully'
        redirect_to group_entities_path(@group)
      else
        flash.now[:alert] = 'An error occuerd , Transaction category creation failed'
        render action: 'new'
      end
    else
      flash.now[:alert] = 'An error occuerd , Transaction creation failed'
      render action: 'new'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
