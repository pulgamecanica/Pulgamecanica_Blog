module Authors
  class ProjectsController < AuthorsController
    protect_from_forgery
    before_action :set_author
    before_action :set_project, only: %i[ edit update destroy publish unpublish updateTags removeTag ]

    # POST /projects or /projects.json
    def index
      @projects = @author.projects.order(updated_at: :desc)
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
          format.html { redirect_to edit_project_path(@project), notice: "Project was successfully created." }
          format.json { render :edit, status: :created, location: @project }
        else
          format.html { render :new, status: :unprocessable_entity, notice: @project.errors }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end
    
    # PATCH/PUT /projects/1 or /projects/1.json
    def update
       respond_to do |format|
        if @project.update(project_params)
          format.html { redirect_to edit_project_path(@project), notice: "Project was successfully updated." }
          format.json { render :edit, status: :ok, location: @project }
        else
          edit
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /projects/1 or /projects/1.json
    def destroy
      @project.destroy

      respond_to do |format|
        format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    def publish
      @project.update(published: true, published_at: Time.now)
      respond_to do |format|
        if @project.save
          format.html { redirect_to edit_project_path(@project), notice: "Project was successfully created." }
          format.json { render :edit, status: :created, location: @project }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end

    def unpublish
      @project.update(published: false, published_at: nil)    
      respond_to do |format|
        if @project.save
          format.html { redirect_to edit_project_path(@project), notice: "Project was successfully created." }
          format.json { render :edit, status: :created, location: @project }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end

    # POST /projects/1/project_tags
    def updateTags
      @project_tags = project_tag_params.map{|tag_id| @project.project_tags.build(tag_id: tag_id)}

      respond_to do |format|
        if @project_tags.each(&:save)
          format.html { redirect_to edit_project_path(@project), notice: "Tag was added to the project successfully." }
          format.json { render :edit, status: :created, location: @project }
        else
          edit
          format.html { redirect_to edit_project_path(@project), status: :unprocessable_entity, notice: @project_tags.each(&:errors) }
          format.json { render json: @project_tags.each(&:errors), status: :unprocessable_entity }
        end
      end
    end

    # DELETE /projects/1/project_tags/1 or /projects/1/project_tags/1.json
    def removeTag
      @tag = @project.project_tags.find_by(tag_id: params[:tag_id]).destroy

      respond_to do |format|
        format.html { redirect_to edit_project_path(@project), notice: "Tag was succesfully removed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = @author.projects.friendly.find(params[:id])
        @project_tags = @project.tags
      end

      # Only allow a list of trusted parameters through.
      def project_params
        params.require(:project).permit(:title, :background_image, :description, :rank, :link, :order, :published)
      end

      def project_tag_params
        params.require(:tag_ids)
      end
  end
end
