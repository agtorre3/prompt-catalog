class CharacterTraitsController < ApplicationController
  def create
    @character = Character.find(params[:character_id])
    @trait = Trait.find(params[:trait_id])
    
    @character_trait = CharacterTrait.find_or_create_by(
      character: @character,
      trait: @trait
    )

    respond_to do |format|
      format.json do
        if @character_trait.persisted?
          render json: {
            success: true,
            character_trait: {
              id: @character_trait.id,
              name: @character_trait.name
            }
          }
        else
          render json: { success: false, errors: @character_trait.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  end
end 