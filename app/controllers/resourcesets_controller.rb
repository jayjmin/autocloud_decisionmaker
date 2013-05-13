class ResourcesetsController < ApplicationController
  # GET /resourcesets
  # GET /resourcesets.json
  def index
    @resourcesets = Resourceset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resourcesets }
    end
  end

  # GET /resourcesets/1
  # GET /resourcesets/1.json
  def show
    @resourceset = Resourceset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resourceset }
    end
  end

  # GET /resourcesets/new
  # GET /resourcesets/new.json
  def new
    @resourceset = Resourceset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resourceset }
    end
  end

  # GET /resourcesets/1/edit
  def edit
    @resourceset = Resourceset.find(params[:id])
  end

  # POST /resourcesets
  # POST /resourcesets.json
  def create
    @resourceset = Resourceset.new(params[:resourceset])

    respond_to do |format|
      if @resourceset.save
        format.html { redirect_to @resourceset, notice: 'Resourceset was successfully created.' }
        format.json { render json: @resourceset, status: :created, location: @resourceset }
      else
        format.html { render action: "new" }
        format.json { render json: @resourceset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resourcesets/1
  # PUT /resourcesets/1.json
  def update
    @resourceset = Resourceset.find(params[:id])

    respond_to do |format|
      if @resourceset.update_attributes(params[:resourceset])
        format.html { redirect_to @resourceset, notice: 'Resourceset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resourceset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resourcesets/1
  # DELETE /resourcesets/1.json
  def destroy
    @resourceset = Resourceset.find(params[:id])
    @resourceset.destroy

    respond_to do |format|
      format.html { redirect_to resourcesets_url }
      format.json { head :no_content }
    end
  end
end
