module ApplicationHelper
	def svg_icon(name)
		begin
			file = image_path(name + ".svg")
		rescue
			"<svg fill='#000000' width='800px' height='800px' viewBox='0 -8 528 528' xmlns='http://www.w3.org/2000/svg' ><path d='M264 456Q210 456 164 429 118 402 91 356 64 310 64 256 64 202 91 156 118 110 164 83 210 56 264 56 318 56 364 83 410 110 437 156 464 202 464 256 464 310 437 356 410 402 364 429 318 456 264 456ZM264 288L328 352 360 320 296 256 360 192 328 160 264 224 200 160 168 192 232 256 168 320 200 352 264 288Z' /></svg>".html_safe
		else
			if Rails.env.production?
				basename = File.basename(file)
				file = File.open(Rails.root.join("public", "assets", basename))
			else
				file = File.open(Rails.root.join("app", "assets", "icons", name + ".svg"))
			end
			file_data = file.read
			file.close
			file_data.html_safe
		end
  end
  
	class RenderWithoutCode < Redcarpet::Render::HTML
    def codespan(code)
    	return if not code
      langs = ["c", "c++", "rb", "json", "py", "js"]
      code_lines = code.lines
      lang = code_lines.first.strip
      if (code_lines.length <= 1)
      	return "<code class=\"bg-peach p-1 rounded\">#{lang}</code>"
      end
      code_lines.shift if langs.include? lang or lang == ""
      result = "<pre><code#{" class=\"language-#{lang}\"" if langs.include? lang}>"
      result += code_lines.join("")
      result += "</code></pre>"
    end

    def block_quote(quote)
    	"<blockquote>#{quote}</blockquote>"
  	end

  	def table(header, body)
  		"<table class=\"table table-striped table-hover\"><thead>#{header}</thead><tbody>#{body}</tbody></table>"
  	end
  end
  
  def markdown(text)
  	return if text.nil?
    options = {hard_wrap: true, fenced_code_blocks: true, autolink: true, no_intra_emphasis: true, strikethrough: true, underline: true, footnotes: true, superscript:  true, autolink: true, tables: true}
    markdown = Redcarpet::Markdown.new(RenderWithoutCode, options)
    markdown.render(text).html_safe
  end
  
end
