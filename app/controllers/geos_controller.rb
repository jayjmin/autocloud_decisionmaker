class GeosController < ApplicationController
  # GET /geos
  # GET /geos.json
  def index
    @geos = Geo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @geos }
    end
  end

  # GET /geos/1
  # GET /geos/1.json
  def show
    @geo = Geo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @geo }
    end
  end

  # GET /geos/new
  # GET /geos/new.json
  def new
    @geo = Geo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @geo }
    end
  end

  # GET /geos/1/edit
  def edit
    @geo = Geo.find(params[:id])
  end

  # POST /geos
  # POST /geos.json
  def create
    @geo = Geo.new(params[:geo])

    respond_to do |format|
      if @geo.save
        format.html { redirect_to @geo, notice: 'Geo was successfully created.' }
        format.json { render json: @geo, status: :created, location: @geo }
      else
        format.html { render action: "new" }
        format.json { render json: @geo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /geos/1
  # PUT /geos/1.json
  def update
    @geo = Geo.find(params[:id])

    respond_to do |format|
      if @geo.update_attributes(params[:geo])
        format.html { redirect_to @geo, notice: 'Geo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @geo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geos/1
  # DELETE /geos/1.json
  def destroy
    @geo = Geo.find(params[:id])
    @geo.destroy

    respond_to do |format|
      format.html { redirect_to geos_url }
      format.json { head :no_content }
    end
  end
end
