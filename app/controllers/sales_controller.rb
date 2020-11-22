class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
    @last_12_months_amount = Sale.last_sales_x_month(12).sum(:amount)
    @last_12_months_avg = Sale.last_sales_x_month(12).average(:amount)
    @last_12_months_qty = Sale.last_sales_x_month(12).count

    @sales_last_12_months_origin_count = Sale.last_sales(12, :origin)
    @sales_last_6_months_origin_count = Sale.last_sales(6, :origin)
    @sales_last_3_months_origin_count = Sale.last_sales(3, :origin)
    @sales_last_1_months_origin_count = Sale.last_sales(1, :origin)

    @sales_last_12_months_blend_count = Sale.last_sales(12, :blend_name)
    @sales_last_6_months_blend_count = Sale.last_sales(6, :blend_name)
    @sales_last_3_months_blend_count = Sale.last_sales(3, :blend_name)
    @sales_last_1_months_blend_count = Sale.last_sales(1, :blend_name)


  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_params
      params.require(:sale).permit(:amount, :blend_name, :origin)
    end
end
