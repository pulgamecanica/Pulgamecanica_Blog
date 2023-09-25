module Authors
  class PagesController < AuthorsController
    protect_from_forgery
    before_action :set_about, only: %i[ new create ]
    before_action :set_page, only: %i[ edit update destroy ]
    before_action :set_author

    # GET /pages or /pages.json
    def index
      @pages = Page.all
    end

    # GET /pages/new
    def new
      @page = @author.pages.build
    end

    # GET /pages/1/edit
    def edit
    end

    # POST /pages or /pages.json
    def create
      @page = @author.pages.build(page_params)
      if (page_params[:published] == "0")
        @page.update(published_at: nil)
      else
        @page.update(published_at: Time.now)
      end
      respond_to do |format|
        if @page.save
          format.html { redirect_to edit_page_path(@page), notice: "Page was successfully created." }
          format.json { render :edit, status: :created, location: @page }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /pages/1 or /pages/1.json
    def update
      if (page_params[:published] == "0")
        @page.update(published_at: nil)
      else
        @page.update(published_at: Time.now)
      end
      respond_to do |format|
        if @page.update(page_params)
          format.html { redirect_to edit_page_path(@page), notice: "Page was successfully updated." }
          format.json { render :edit, status: :ok, location: @page }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /pages/1 or /pages/1.json
    def destroy
      @page.destroy

      respond_to do |format|
        format.html { redirect_to pages_url, notice: "Page was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      def set_about
        @about = <<-eos
# Pages Manual

    > Be welcome to this awesome manual.

    > Pages support inline Markdown language.

    > This powerful tool can help you create awesome pages!


***

### How does it work?

First set your page title, which must be between [1..12] characters

Now you can place your Markdown document (text) on the page body section

There is no size limit and I made sure to support many features from Markdown

Go ahead and play around with it

Automatic syntax highlight is supported, you can use ` ``` ```lang-name to create code blocks

```rb
if ruby
  puts "clean_code"
end
```

Shout out to https://highlightjs.org/ for making the automatic syntax highlight possible!

Explicit language support for the following languages:

+ c
+ c++
+ rb
+ json
+ py
+ js

***

#### Tips

    When you are editing your page, after you are finished, click the update button

    Now click the Markdown icon on the topp right side of the webpage

    You will be able to see a preview of your document!

***

### Links where you can learn

[Markdown Documentation](https://www.markdownguide.org/basic-syntax/)

[Examples on GitHub](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

# `good luck and have fun`
eos
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = Page.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def page_params
        params.require(:page).permit(:title, :body, :author_id, :published)
      end
  end
end
