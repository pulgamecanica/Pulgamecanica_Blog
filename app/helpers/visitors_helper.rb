module VisitorsHelper
	def default_meta_tags
    {
      site: 'pulgamecanica.herokuapp',
      title: 'Pulgamecanica\'s Web',
      reverse: true,
      separator: '|',
      description: 'Coding blog by pulgamecanica',
      keywords: '42, programming, coding, pulgamecanica',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('author_img.ico') },
        { href: image_url('author_img.jpg'), rel: 'author-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: 'pulgamecanica.herokuapp',
        title: 'Pulgamecanica\'s Web',
        description: 'Coding blog by pulgamecanica', 
        type: 'website',
        url: request.original_url,
        image: image_url('author_img.jpg')
      }
    }
  end
end
