class RateelemsController < ApplicationController
  # GET /rateelems
  # GET /rateelems.json
  def index
    @rateelems = Rateelem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rateelems }
    end
  end

  # GET /rateelems/1
  # GET /rateelems/1.json
  def show
    @rateelem = Rateelem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rateelem }
    end
  end

  # GET /rateelems/new
  # GET /rateelems/new.json
  def new
    @rateelem = Rateelem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rateelem }
    end
  end

  # GET /rateelems/1/edit
  def edit
    @rateelem = Rateelem.find(params[:id])
  end

  # POST /rateelems
  # POST /rateelems.json
  def create
    @rateelem = Rateelem.new(params[:rateelem])

    respond_to do |format|
      if @rateelem.save
        format.html { redirect_to @rateelem, notice: 'Rateelem was successfully created.' }
        format.json { render json: @rateelem, status: :created, location: @rateelem }
      else
        format.html { render action: "new" }
        format.json { render json: @rateelem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rateelems/1
  # PUT /rateelems/1.json
  def update
    @rateelem = Rateelem.find(params[:id])

    respond_to do |format|
      if @rateelem.update_attributes(params[:rateelem])
        format.html { redirect_to @rateelem, notice: 'Rateelem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rateelem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rateelems/1
  # DELETE /rateelems/1.json
  def destroy
    @rateelem = Rateelem.find(params[:id])
    @rateelem.destroy

    respond_to do |format|
      format.html { redirect_to rateelems_url }
      format.json { head :no_content }
    end
  end
end
