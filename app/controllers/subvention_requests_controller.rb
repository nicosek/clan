class SubventionRequestsController < ApplicationController
  def new
    @subvention = Subvention.find(params[:subvention_id])
    @subvention_request = SubventionRequest.new
  end

  def create
    @subvention = Subvention.find(params[:subvention_id])
    @subvention_request = SubventionRequest.new(subvention_request_params)
    @subvention_request.subvention = @subvention
    if subvention_request_params[:amount_asked].to_i * 100 <= @subvention.amount \
      && @subvention_request.save(subvention_request_params)\
      && date_condition(@subvention.start_date, @subvention.end_date)
      redirect_to subvention_subvention_request_path(@subvention, @subvention_request)
    else
      @subvention_request.errors.add(:amount_asked, message: "Le montant du remboursement ne doit pas\
   dépasser celui autorisé par la subvention") if subvention_request_params[:amount_asked].to_i * 100 > @subvention.amount
      @subvention_request.errors.add(:date, message: "Vous ne pouvez pas encore/plus bénéficier de cette subvention.")\
       if !date_condition(@subvention.start_date, @subvention.end_date)
      render :new
    end
  end

  def show
    @subvention = Subvention.find(params[:subvention_id])
    @subvention_request = SubventionRequest.find(params[:id])
  end

  def index
  end

  private

  def subvention_request_params
    params.require(:subvention_request).permit(:email, :justif_path, :amount_asked)
  end

  def date_condition(start_date, end_date)
    Date.today >= start_date && Date.today <= end_date
  end
end
