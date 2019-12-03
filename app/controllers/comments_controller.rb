class CommentsController < ApplicationController
before_action :find_grade
 before_action :find_comment, only: [:destroy, :edit , :update]
def create
@comment = @grade.comments.create(params[:comment].permit(:content))
@comment.save
if @comment.save
  redirect_to grade_path(@grade)
else
  redirect_to grade_path(@grade)
end
end
def destroy
@comment.destroy
redirect_to grade_path(@grade)
end
def edit
end
def update
if @comment.update(params[:comment].permit(:content))
  redirect_to grade_path(@grade)
  else
    render 'edit'
  end
end
private
def find_grade
  @grade = Grade.find(params[:grade_id])
end
def find_comment
  @comment = @grade.comments.find(params[:id])
end
end