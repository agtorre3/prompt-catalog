class TraitsController < ApplicationController
  def index
    if params[:query].present?
      search_terms = params[:query].split.map { |term| "%#{term}%" }.join
      @traits = Trait.where("name ILIKE ?", search_terms)
                     .limit(15)
    else
      @traits = Trait.all
    end
    
    render json: @traits.map { |trait| { id: trait.id, name: trait.name } }
  end
end
