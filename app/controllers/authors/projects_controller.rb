module Authors
  class ProjectsController < AuthorsController
    protect_from_forgery
    before_action :set_author
    before_action :set_project, only: %i[ edit update destroy ]

    # POST /projects or /projects.json
    def index
      @projects = @author.projects
    end

    # GET /projects/1 or /projects/1.json
    def edit
      @reference = @project.references.build
      @project_tags = @project.tags.order(:title)
      @tags = Tag.all.filter{|t| not t.in?(@project_tags)}
    end

    # GET /projects/new
    def new
      @project = @author.projects.build
    end

    # POST /projects or /projects.json
    def create
      @project = @author.projects.build(project_params)

      respond_to do |format|
        if @project.save
          format.html { redirect_to edit_project_path(@project), notice: "Post was successfully created." }
          format.json { render :edit, status: :created, location: @project }
        else
          format.html { render :new, status: :unprocessable_entity, notice: @project.errors }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end
    
    # PATCH/PUT /projects/1 or /projects/1.json
    def update
    end

    # DELETE /projects/1 or /projects/1.json
    def destroy
    end

    private

     def set_author
        @author = current_author
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = @author.projects.friendly.find(params[:id])
        @project_tags = @project.tags
      end

      # Only allow a list of trusted parameters through.
      def project_params
        params.require(:project).permit(:title, :background_image, :description, :rank, :order, :published)
      end
  end
end
