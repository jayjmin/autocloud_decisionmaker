class JcloudnamesController < ApplicationController
  # GET /jcloudnames
  # GET /jcloudnames.json
  def index
    @jcloudnames = Jcloudname.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jcloudnames }
    end
  end

  # GET /jcloudnames/1
  # GET /jcloudnames/1.json
  def show
    @jcloudname = Jcloudname.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @jcloudname }
    end
  end

  # GET /jcloudnames/new
  # GET /jcloudnames/new.json
  def new
    @jcloudname = Jcloudname.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jcloudname }
    end
  end

  # GET /jcloudnames/1/edit
  def edit
    @jcloudname = Jcloudname.find(params[:id])
  end

  # POST /jcloudnames
  # POST /jcloudnames.json
  def create
    @jcloudname = Jcloudname.new(params[:jcloudname])

    respond_to do |format|
      if @jcloudname.save
        format.html { redirect_to @jcloudname, notice: 'Jcloudname was successfully created.' }
        format.json { render json: @jcloudname, status: :created, location: @jcloudname }
      else
        format.html { render action: "new" }
        format.json { render json: @jcloudname.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jcloudnames/1
  # PUT /jcloudnames/1.json
  def update
    @jcloudname = Jcloudname.find(params[:id])

    respond_to do |format|
      if @jcloudname.update_attributes(params[:jcloudname])
        format.html { redirect_to @jcloudname, notice: 'Jcloudname was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @jcloudname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jcloudnames/1
  # DELETE /jcloudnames/1.json
  def destroy
    @jcloudname = Jcloudname.find(params[:id])
    @jcloudname.destroy

    respond_to do |format|
      format.html { redirect_to jcloudnames_url }
      format.json { head :no_content }
    end
  end
end
