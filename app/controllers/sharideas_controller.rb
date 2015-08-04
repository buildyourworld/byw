class SharideasController < ApplicationController


		 def index
	    @sharideas = Sharidea.all
	    respond_to do |format|
	      format.html #index.html.erb
	    end
	  end

	  def show
	    @sharidea = Sharidea.find(params[:id])
	    respond_to do |format|
	      format.html #show.html.erb
	    end
	  end

	  def new
  		@sharidea = Sharidea.new
	end

	def create
		@sharidea = Sharidea.new (sharidea_params)

		 respond_to do |format|
      if @sharidea.save
        format.html { redirect_to @sharidea, notice: 'sharidea was successfully created.' }
        format.json { render :show, status: :created, location: @sharidea }
      else
        format.html { redirect_to new_sharidea_path }
        flash[:alert] = @sharidea.errors
        #format.json { render json: @sharidea.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy 
		@sharidea.destroy
    	respond_to do |format|
			format.html { redirect_to sharideas_url, notice: 'sharidea was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	
	def sharidea_params
	  params.require(:sharidea).permit(:title, :url)
	end

end
