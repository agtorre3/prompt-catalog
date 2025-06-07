class RelationshipsController < ApplicationController
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :json_request?

  def create
    # First try to find an existing relationship with the same type and members
    @relationship = find_existing_relationship
    
    if @relationship.nil?
      # If no existing relationship found, create a new one
      @relationship = Relationship.new(relationship_params)
      unless @relationship.save
        return render json: { errors: @relationship.errors }, status: :unprocessable_entity
      end
    end
    
    render json: @relationship.as_json(include: { characters: { only: [:id, :name] } })
  end

  private

  def find_existing_relationship
    # Get the character IDs from the params
    character_ids = relationship_params[:relationship_members_attributes].map { |member| member[:character_id] }.sort
    
    # Find a relationship with the same type and exactly the same members
    Relationship.joins(:characters)
               .where(relationship_type: relationship_params[:relationship_type])
               .group('relationships.id')
               .having('array_agg(characters.id ORDER BY characters.id) = ARRAY[?]::bigint[]', character_ids)
               .first
  end

  def relationship_params
    params.require(:relationship).permit(:relationship_type, relationship_members_attributes: [:character_id])
  end

  def json_request?
    request.format.json?
  end
end 