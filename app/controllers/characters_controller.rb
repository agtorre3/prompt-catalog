class CharactersController < ApplicationController
  before_action :set_character, only: %i[ show edit update destroy ]

  # GET /characters or /characters.json
  def index
    if params[:query].present?
      search_terms = params[:query].split.map { |term| "%#{term}%" }.join
      @characters = Character.where("name ILIKE ?", search_terms)
                             .limit(15)
    else
      @characters = Character.all
    end
  end

  # GET /characters/1 or /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters or /characters.json
  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to character_url(@character), notice: "Character was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /characters/1 or /characters/1.json
  def update
      if @character.update(character_params)
        redirect_to character_url(@character), notice: "Character was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /characters/1 or /characters/1.json
  def destroy
    if @character.destroy!
      redirect_to characters_url, notice: "Character was successfully destroyed."
    else
      flash[:alert] = "Character could not be destroyed."
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character
    @character = Character.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def character_params
    params.require(:character).permit(:name)
  end
end
