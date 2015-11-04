class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  respond_to :html, :json

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
    @tags = Tag.all
    @ratings = Rating.all
    @recipes = Recipe.order(sort_column + " " + sort_direction)
    @top = []
    @recipes.each do |recipe|
      if recipe.average_rating.blank?
          norating = []
          norating << recipe
          @top = norating.sample
          @top.save
      end
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe.tags.build
    @recipe.ratings.build
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @recipe.tags.build
    @recipe.ratings.build
  end

  # GET /recipes/1/edit
  def edit
    @recipe.tags.build
    @recipe.ratings.build
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    @recipe.average_rating = @recipe.ratings.average(:rate)

    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  #ADD Tag
  def add_tag
    @recipe = Recipe.find(params[:id])
    newTag = Tag.new(params[:tag])
    if newTag.valid?
      newTag.name.downcase! # ! alters the original
      newTag.save
      @recipe.tags << newTag
      @recipe.save
    end
    render 'show.html.erb'
  end

  #ADD Rating
  def add_rating
    @recipe = Recipe.find(params[:id])
    newRating = Rating.new(params[:rating])
    if newRating.valid?
      newRating.save
      @recipe.ratings << newRating
      @recipe.average_rating = @recipe.ratings.average(:rate)
      @recipe.save
    end
    render 'show.html.erb'
  end


  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_word
    if !params[:search_word].nil?
        search_word = params[:search_word].strip
        @recipes = Recipe.where("title LIKE '%#{search_word}%'")
    end
  end

  def get_random_recipe
    @recipe = Recipe.all.sample
    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { render :show, status: :ok, location: @recipe }
    end
  end


  private

    # Setting defaults for sorting
    def sort_column
      Recipe.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title, :author, :ingredients, :instructions, :image, tags_attributes: [:id, :name, :_destroy], ratings_attributes: [:id, :rate, :_destroy])
    end
end
