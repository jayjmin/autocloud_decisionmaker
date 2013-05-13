class OperatingsystemsController < ApplicationController
  # GET /operatingsystems
  # GET /operatingsystems.json
  def index
    @operatingsystems = Operatingsystem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @operatingsystems }
    end
  end

  # GET /operatingsystems/1
  # GET /operatingsystems/1.json
  def show
    @operatingsystem = Operatingsystem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @operatingsystem }
    end
  end

  # GET /operatingsystems/new
  # GET /operatingsystems/new.json
  def new
    @operatingsystem = Operatingsystem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @operatingsystem }
    end
  end

  # GET /operatingsystems/1/edit
  def edit
    @operatingsystem = Operatingsystem.find(params[:id])
  end

  # POST /operatingsystems
  # POST /operatingsystems.json
  def create
    @operatingsystem = Operatingsystem.new(params[:operatingsystem])

    respond_to do |format|
      if @operatingsystem.save
        format.html { redirect_to @operatingsystem, notice: 'Operatingsystem was successfully created.' }
        format.json { render json: @operatingsystem, status: :created, location: @operatingsystem }
      else
        format.html { render action: "new" }
        format.json { render json: @operatingsystem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /operatingsystems/1
  # PUT /operatingsystems/1.json
  def update
    @operatingsystem = Operatingsystem.find(params[:id])

    respond_to do |format|
      if @operatingsystem.update_attributes(params[:operatingsystem])
        format.html { redirect_to @operatingsystem, notice: 'Operatingsystem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @operatingsystem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operatingsystems/1
  # DELETE /operatingsystems/1.json
  def destroy
    @operatingsystem = Operatingsystem.find(params[:id])
    @operatingsystem.destroy

    respond_to do |format|
      format.html { redirect_to operatingsystems_url }
      format.json { head :no_content }
    end
  end
end
