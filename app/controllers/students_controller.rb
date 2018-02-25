class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @a = "active"
    if @student.active == false
      @a = "inactive"
    end

  end

  def activate
    set_student
    toggle_active
    redirect_to action: "show", id: @student.id
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def toggle_active
      @student.toggle!(:active)
    end
end
