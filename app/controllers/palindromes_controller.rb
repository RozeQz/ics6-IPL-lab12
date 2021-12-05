class PalindromesController < ApplicationController
  before_action :set_palindrome, only: %i[ show edit update destroy ]

  # GET /palindromes or /palindromes.json
  def index
    @palindromes = Palindrome.all
  end

  # GET /palindromes/1 or /palindromes/1.json
  def show
  end

  # GET /palindromes/new
  def new
    @palindrome = Palindrome.new
  end

  # GET /palindromes/1/edit
  def edit
  end

  # POST /palindromes or /palindromes.json
  def create
    @palindrome = Palindrome.new(palindrome_params)

    respond_to do |format|
      if @palindrome.save
        format.html { redirect_to @palindrome, notice: "Palindrome was successfully created." }
        format.json { render :show, status: :created, location: @palindrome }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @palindrome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /palindromes/1 or /palindromes/1.json
  def update
    respond_to do |format|
      if @palindrome.update(palindrome_params)
        format.html { redirect_to @palindrome, notice: "Palindrome was successfully updated." }
        format.json { render :show, status: :ok, location: @palindrome }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @palindrome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /palindromes/1 or /palindromes/1.json
  def destroy
    @palindrome.destroy
    respond_to do |format|
      format.html { redirect_to palindromes_url, notice: "Palindrome was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_palindrome
      @palindrome = Palindrome.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def palindrome_params
      params.require(:palindrome).permit(:input, :output)
    end
end
