class NamesController < ApplicationController
	def index
		@names=Name.all
	end
	
	def show
		@name=Name.find(params[:id])
	end

end
