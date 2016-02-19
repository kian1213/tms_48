class Admin::SubjectsController < AdminController
  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find params[:id]
    @subject_tasks = @subject.tasks
  end

  def new
    @subject = Subject.new
    @subject.tasks.build
  end

  def create
    @subject = Subject.new subject_params

    if @subject.save
      flash[:success] = t ".success"
      redirect_to admin_subjects_path
    else
      render "new"
    end
  end

  def edit
    @subject = Subject.find params[:id]
  end

  def update
    @subject = Subject.find params[:id]

    if @subject.update_attributes subject_params
      flash[:success] = t ".success"
      redirect_to admin_subjects_path
    else
      render "edit"
    end
  end

  def destroy
    @subject = Subject.find params[:id]

    @subject.destroy
    flash[:success] = t ".destroy"
    redirect_to admin_subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit :title, :instruction,
      tasks_attributes: [:id, :subject_id, :title, :_destroy]
  end
end