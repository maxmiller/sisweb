class SubgroupsController < ApplicationController
  # GET /subgroups
  # GET /subgroups.json
  def index
    @subgroups = Subgroup.all

    respond_to do |format|
      format.html # index1.html.erb
      format.json { render json: @subgroups }
    end
  end

  # GET /subgroups/1
  # GET /subgroups/1.json
  def show
    @subgroup = Subgroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subgroup }
    end
  end

  # GET /subgroups/new
  # GET /subgroups/new.json
  def new
    @subgroup = Subgroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subgroup }
    end
  end

  # GET /subgroups/1/edit
  def edit
    @subgroup = Subgroup.find(params[:id])
  end

  # POST /subgroups
  # POST /subgroups.json
  def create
    @subgroup = Subgroup.new(params[:subgroup])

    respond_to do |format|
      if @subgroup.save
        format.html { redirect_to subgroups_path, notice: 'Subgroupo criado.' }
        format.json { render json: @subgroup, status: :created, location: @subgroup }
      else
        format.html { render action: "new" }
        format.json { render json: @subgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subgroups/1
  # PUT /subgroups/1.json
  def update
    @subgroup = Subgroup.find(params[:id])

    respond_to do |format|
      if @subgroup.update_attributes(params[:subgroup])
        format.html { redirect_to @subgroup, notice: 'Subgroup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subgroups/1
  # DELETE /subgroups/1.json
  def destroy
    @subgroup = Subgroup.find(params[:id])
    @subgroup.destroy

    respond_to do |format|
      format.html { redirect_to subgroups_url }
      format.json { head :no_content }
    end
  end
end
