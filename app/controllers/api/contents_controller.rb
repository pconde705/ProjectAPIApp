class Api::ContentsController < ApplicationController
require 'nokogiri'
require 'open-uri'

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

  def index
    @contents = Content.all
    render :index
  end

  private
  def content_params
    params.require(:content).permit(:page_url)
  end
end
