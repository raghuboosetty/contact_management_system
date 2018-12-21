class ContactsController < ApplicationController
  before_action :set_group, except: :all
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def all
    @contacts = Contact.joins(group: :employee).where("groups.employee_id = ?", current_employee.id)
  end

  # GET /groups/1/contacts
  # GET /groups/1/contacts.json
  def index
    @contacts = @group.contacts.all
  end

  # GET /groups/1/contacts/1
  # GET /groups/1/contacts/1.json
  def show
  end

  # GET /groups/1/contacts/new
  def new
    @contact = @group.contacts.new
  end

  # GET /groups/1/contacts/1/edit
  def edit
  end

  # POST /groups/1/contacts
  # POST /groups/1/contacts.json
  def create
    @contact = @group.contacts.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to [@group, @contact], notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1/contacts/1
  # PATCH/PUT /groups/1/contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to [@group, @contact], notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1/contacts/1
  # DELETE /groups/1/contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to group_contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = current_employee.groups.find(params[:group_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = @group.contacts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :phone)
    end
end
