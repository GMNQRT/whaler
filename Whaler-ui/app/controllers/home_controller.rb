class HomeController < ApplicationController
  def index
  end

  def home
    render layout: false
  end
end