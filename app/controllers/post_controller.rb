class PostController < ApplicationController

    before_action :is_authenticated?, except: [:index]

  def index
  end

  def new
  end

  def title
  end

  def link
  end
end
