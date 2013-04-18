class RolesController < ApplicationController
  # GET /Roles
  # GET /Roles.xml
  before_filter :authenticate_user!

  def index
    @roles = Role.all

    respond_to do |format|
      format.html # index1.html.erb
      format.xml  { render :xml => @roles }
    end
  end

  # GET /Roles/1
  # GET /Roles/1.xml
  def show
    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @role }
    end
  end

  # GET /Roles/new
  # GET /Roles/new.xml
  def new
    @role = Role.new
   # @current_method = "new"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @role }
    end
  end

  # GET /Roles/1/edit
  def edit
    @role = Role.find(params[:id])
  end

  # POST /Roles
  # POST /Roles.xml
  def create
    @role = Role.new(params[:role])

    respond_to do |format|
      if @role.save
        format.html { redirect_to :action=> "index" }
        format.xml  { render :xml => @role, :status => :created, :location => @role }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /Roles/1
  # PUT /Roles/1.xml
  def update
    @role = Role.find(params[:id])
   
    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to :action=> "index" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /Roles/1
  # DELETE /Roles/1.xml
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to(Roles_url) }
      format.xml  { head :ok }
    end
  end
end