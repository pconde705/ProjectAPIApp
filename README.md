<h1 align="center"> ProjectAPIApp </h1> <br>
<h4 align="center">
   ProjectAPIApp (generic name) is an example of a tiny RESTful API to index a page's content. This means it parses a page's content then stores its content in the database. In this case, the content being stored is the content inside all the  h1, h2, h3 and links (anchor) tags.
</h4>

## Introduction

This API, built in Ruby on Rails, has two endpoints. One endpoint receives the URL of the page, grabs its content and stores its content with the tags h1, h2 and h3 and the links. The other endpoint lists the urls and content stored in the database. 

```Ruby
  def create
    page = Nokogiri::HTML(open(content_params[:page_url]))
    page.css('a').each do |anchor|
      Content.create(tag: 'a', content: anchor.content, page_url: content_params[:page_url])
    end
    page.css('h1').each do |header|
      Content.create(tag: 'h1', content: header.content, page_url: content_params[:page_url])
    end
    page.css('h2').each do |header|
      Content.create(tag: 'h2', content: header.content, page_url: content_params[:page_url])
    end
    page.css('h3').each do |header|
      Content.create(tag: 'h3', content: header.content, page_url: content_params[:page_url])
    end
    render json: {message: "Success"}
  end
```

## Testing

To test this API, download this repo, and in your terminal navigate to the root folder, and run 'rails s'. Then using Postman or an equivalent API testing environment, type in localhost:3000/api/contents in the request URL field, choose a GET or POST request (keep in mind that if this is your first time testing, start with POST, so when you run a GET request you have something to fetch from the database). For your key, type in 'content[page_url]' and for your value, simply copy paste the url of any website you wish to test.

## JSON View

If you wish to see the parsed JSON in your browser, then once you've made a succesful POST request, navigate to 'http://localhost:3000/api/contents' where you will see all the data from the POST requests you've made.

```ruby
@contents.each do |content|
  json.set! content.page_url do
    json.set! content.id do
      json.extract! content, :tag, :content
    end
  end
end
```
