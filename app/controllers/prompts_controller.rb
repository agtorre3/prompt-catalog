class PromptsController < ApplicationController
  before_action :set_prompt, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create]

  # GET /prompts or /prompts.json
  def index
    @prompts = Prompt.all
  end

  # GET /prompts/1 or /prompts/1.json
  def show
  end

  # GET /prompts/new
  def new
    @prompt = Prompt.new
  end

  # GET /prompts/1/edit
  def edit
  end

  # POST /prompts or /prompts.json
  def create
    @prompt = current_user.prompts.build(prompt_params)

    if @prompt.save
      redirect_to prompt_url(@prompt), notice: "Prompt was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /prompts/1 or /prompts/1.json
  def update
    if @prompt.update(prompt_params)
      redirect_to prompt_url(@prompt), notice: "Prompt was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /prompts/1 or /prompts/1.json
  def destroy
    @prompt.destroy!

    redirect_to prompts_url, notice: "Prompt was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_prompt
    @prompt = Prompt.includes(:characters, :user).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def prompt_params
    params.require(:prompt).permit(:title, :description, character_ids: [], relationship_ids: [])
  end
end
