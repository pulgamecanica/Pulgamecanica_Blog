module Authors
	class ReferencesController < ProjectsController
    protect_from_forgery
		before_action :set_author
    before_action :set_project
    before_action :set_references, only: %i[ destroy ]

		def create
			@reference = @project.references.build(reference_params)
      @project_tags = @project.tags.order(:title)
      @tags = Tag.all.filter{|t| not t.in?(@project_tags)}
      respond_to do |format|
        if @reference.save
          format.html { redirect_to edit_project_path(@project), notice: "Reference was successfully created." }
          format.json { render :edit, status: :created, location: @project }
        else
          format.html { render :edit, status: :unprocessable_entity, notice: "Reference couldn't be created" }
          format.json { render json: @reference.errors, status: :unprocessable_entity }
        end
      end
		end

		def destroy
			@reference.destroy
      respond_to do |format|
        format.html { redirect_to projects_url, notice: "Reference was successfully destroyed." }
        format.json { head :no_content }
      end
		end

		private

    def set_project
      @project = @author.projects.friendly.find(params[:project_id])
    end

    def set_reference
      @reference = @project.references.find(params[:id])
    end

		def reference_params
      params.require(:reference).permit(:link, :name)
    end
	end
end
