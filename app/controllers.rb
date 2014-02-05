Emergence::Site.controllers  do
  
  get '/' do
    'Hello world!'
  end


  get '/chapters/:id' do
    @chapter = Chapter.get(params[:id])
    markdown_toc = Redcarpet::Markdown.new(Redcarpet::Render::HTML_TOC)
    @toc = markdown_toc.render(@chapter.body)
    markdown = Redcarpet::Markdown.new(HTMLWithPants, :autolink => true, :with_toc_data => true)
    @body = markdown.render(@chapter.body)
    slim :chapters

  end



end
