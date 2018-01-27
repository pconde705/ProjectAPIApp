@contents.each do |content|
  json.set! content.page_url do
    json.set! content.id do
      json.extract! content, :tag, :content
    end
  end
end
