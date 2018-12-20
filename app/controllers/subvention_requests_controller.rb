class SubventionRequestsController < ApplicationController
  def new
    @subvention = Subvention.find(params[:subvention_id])
    @subvention_request = SubventionRequest.new
  end

  def create
    @subvention = Subvention.find(params[:subvention_id])
    @subvention_request = SubventionRequest.new(subvention_request_params)
    @subvention_request.subvention = @subvention
    if subvention_request_params[:amount_asked].to_i <= @subvention.amount && @subvention_request.save(subvention_request_params)
      redirect_to subventions_path
    else
      @subvention_request.errors.add(:amount_asked, message: "Le montant du remboursement ne doit pas\
   dépasser celui autorisé par la subvention") if subvention_request_params[:amount_asked].to_i > @subvention.amount
      render :new
    end
  end

  def show
  end

  def index
  end

  private

  def subvention_request_params
    params.require(:subvention_request).permit(:email, :justif_path, :amount_asked)
  end
end
