class SpendEntriesController < ApplicationController
  before_action :set_spend_entry, only: [:show, :edit, :update, :destroy]

  # GET /spend_entries
  # GET /spend_entries.json
  def index
    #@spend_entries = SpendEntry.all
  end

  # GET /spend_entries/1
  # GET /spend_entries/1.json
  def show
  end

  # GET /spend_entries/new
  def new
    @spend_entry = SpendEntry.new
  end

  # GET /spend_entries/1/edit
  def edit
  end

  # POST /spend_entries
  # POST /spend_entries.json
  def create
    @spend_entry = SpendEntry.new(spend_entry_params)

    respond_to do |format|
      if @spend_entry.save
        format.html { redirect_to spend_category_user_path(id: spend_entry_params[:spend_category_user_id]) }
        #format.json { render :show, status: :created, location: @spend_entry }
      else
        format.html { redirect_to spend_category_user_path(id: spend_entry_params[:spend_category_user_id]) }

        #format.html { render :new }
        #format.json { render json: @spend_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spend_entries/1
  # PATCH/PUT /spend_entries/1.json
  def update
    respond_to do |format|
      if @spend_entry.update(spend_entry_params)
        format.html { redirect_to @spend_entry, notice: 'Spend entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @spend_entry }
      else
        format.html { render :edit }
        format.json { render json: @spend_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spend_entries/1
  # DELETE /spend_entries/1.json
  def destroy
    @spend_entry.destroy
    respond_to do |format|
      format.html { redirect_to spend_category_user_path(id: params[:spend_category_user_id]) }

      #format.html { redirect_to spend_entries_url, notice: 'Spend entry was successfully destroyed.' }
      #format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spend_entry
      @spend_entry = SpendEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spend_entry_params
      additional_params = {user_id: current_user.id}
      params.require(:spend_entry).permit(:amount, :spend_category_user_id).merge(additional_params)
    end
end
