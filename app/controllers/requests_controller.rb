class RequestsController < ApplicationController

	# GET /requests/new
	def new
		@request = Request.new
	end

	# GET /requests/1
	# GET /requests/1.json
	def show
	end

	# POST /@requests
	# POST /@requests.json
	def create
		@request = Request.new(request_params)

		respond_to do |format|
			if @request.save
				format.html { redirect_to root_path, notice: 'Request was successfully created.' }
				format.json { render :show, status: :created, location: @request }
			else
				format.html { render :new }
				format.json { render json: @request.errors, status: :unprocessable_entity }
			end
		end
	end


	private

	# Never trust parameters from the scary internet, only allow the white list through.
	def request_params
		params.require(:request).permit(:name, :about, :image)
	end


end