class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]
  def index
    if current_user && current_user.admin == false
    @grades = Grade.where(user_id: current_user.id == logger)
    else
      @grades = Grade.all
    end
  end
  def show
  end
  def new
    @grade = Grade.new
  end
  def edit
  end
  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to @grade, notice: 'Grade was successfully created.' }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to @grade, notice: 'Grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url, notice: 'Grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_grade
      @grade = Grade.find(params[:id])
    end
    def grade_params
      params.require(:grade).permit(:mark, :course_id, :user_id)
    end
end
