class StaticPagesController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def secret
  end
end
