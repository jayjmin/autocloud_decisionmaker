class ServicetypesController < ApplicationController
  # GET /servicetypes
  # GET /servicetypes.json
  def index
    @servicetypes = Servicetype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @servicetypes }
    end
  end

  # GET /servicetypes/1
  # GET /servicetypes/1.json
  def show
    @servicetype = Servicetype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @servicetype }
    end
  end

  # GET /servicetypes/new
  # GET /servicetypes/new.json
  def new
    @servicetype = Servicetype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @servicetype }
    end
  end

  # GET /servicetypes/1/edit
  def edit
    @servicetype = Servicetype.find(params[:id])
  end

  # POST /servicetypes
  # POST /servicetypes.json
  def create
    @servicetype = Servicetype.new(params[:servicetype])

    respond_to do |format|
      if @servicetype.save
        format.html { redirect_to @servicetype, notice: 'Servicetype was successfully created.' }
        format.json { render json: @servicetype, status: :created, location: @servicetype }
      else
        format.html { render action: "new" }
        format.json { render json: @servicetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /servicetypes/1
  # PUT /servicetypes/1.json
  def update
    @servicetype = Servicetype.find(params[:id])

    respond_to do |format|
      if @servicetype.update_attributes(params[:servicetype])
        format.html { redirect_to @servicetype, notice: 'Servicetype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @servicetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servicetypes/1
  # DELETE /servicetypes/1.json
  def destroy
    @servicetype = Servicetype.find(params[:id])
    @servicetype.destroy

    respond_to do |format|
      format.html { redirect_to servicetypes_url }
      format.json { head :no_content }
    end
  end
end
