class StaticPagesController < ApplicationController
  before_filter :authenticate_usuario!
  def index
  end
end