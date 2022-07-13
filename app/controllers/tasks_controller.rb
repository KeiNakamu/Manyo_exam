class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all.order(created_at: "DESC")
    @tasks = Task.all.order(title: "DESC") if params[:sort_title]
    @tasks = Task.all.order(deadline: "DESC") if params[:sort_deadline]
    @tasks = Task.all.order(priority: "ASC") if params[:sort_priority]

    if params[:task].present?
      if params[:task][:title].present? && params[:task][:status].present?
        @tasks = Task.search_title(params[:task][:title]).search_status(params[:task][:status])
      elsif params[:task][:title].present?
        @tasks = Task.search_title(params[:task][:title])
      elsif params[:task][:status].present?
        @tasks = Task.search_status(params[:task][:status])
      end
      # @tasks = Task.where('title LIKE ?', "%#{params[:task][:title]}%")if params[:task][:title].present?
      # @tasks = @tasks.where(status: params[:task][:status])if params[:task][:status].present?
    end
    @tasks = Task.all.page(params[:page]).per(5)
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    params[:task]
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :content, :deadline, :status, :priority, :id)
    end

    def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
    
    def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : 'id'
    end
end
