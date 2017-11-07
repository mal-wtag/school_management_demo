class CoursesController < ApplicationController
  before_filter :user_authenticated!
  before_action :set_course, only: [ :show, :edit, :update, :destroy ]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = 'Course Created'
      redirect_to @course
    else
        render :new
    end

  end


  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
      if @course.update(course_params)
        redirect_to @course
        flash[:success] = 'Course updated'
      else
        render :edit
      end
  end


  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
      redirect_to courses_url
      flash[:danger] = 'Course deleted'
    end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name,:credit)
    end
end
