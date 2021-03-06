class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
      @id = Customer.maximum('customer_id') +1
  end

  # GET /customers/1/edit
  def edit
    @id = Customer.find_by_customer_id(params[:id]).customer_id
    if @id.nil?
      @id = Customer.maximum('customer_id') +1
    end
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_path, notice: 'Cliente agregado.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customers_path, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find_by_customer_id(params[:id])
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url , notice: "Cliente Eliminado" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find_by_customer_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      #params[:customer]
      params.require(:customer).permit(:customer_id, :first_name, :last_name, :address, :city, :state, :zip, :phone, :fax)
    end
end
