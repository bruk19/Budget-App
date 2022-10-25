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

  def index_transaction
    @group = Group.find_by(id: params[:group_id])
  end

  def new_transaction
    @entity = Activity.new
    @groups = current_user.groups.all
  end

  def create_transaction
    @entity = Entity.new(entity_params)
    @entity.author_id = current_user.id
    if @entity.save
      flash[:success] = 'Successfully created'
      redirect_to entities_home_path(@entity.groups.first.id)
    else
      flash[:error] = 'Something went wrong'
      render 'new_transaction'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_ids)
  end
end
