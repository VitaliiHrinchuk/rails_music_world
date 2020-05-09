class ComposersController < ApplicationController

  def index
    @composers = Composer.all.select('id, name,avatar')
    @data = @composers.map(&:attributes)
  end

  def read 
    @composer = Composer.find(params[:id])
  end
end
