class CreditsController < ApplicationController

 def new

 end


 def create



  @credit_card = ActiveMerchant::Billing::CreditCard.new(
    :number     => (params[:number]), 
    :month      => (params[:month]),
    :year       => (params[:year]),
    :first_name => (params[:first_name]),
    :last_name  => (params[:last_name]),
    :verification_value  => (params[:verification_value]),
    )    

  if @credit_card.valid?
  # Create a gateway object to the TrustCommerce service
  gateway = ActiveMerchant::Billing::AuthorizeNetGateway.new(
    :login    => '9QK4kwT4m42',
    :password => '6gh974CmA92UP2hv'
    )
  response = gateway.authorize(100, @credit_card)
  
  if response.success?
    # Capture the money
    gateway.capture(100, response.authorization)
    @credit = current_user.credits.create(credits: true)
    flash[:notice] = "Dodano kredyt!!"
    redirect_to robot_index_path
  else
    flash[:alert] = "Błąd!!"
    render :new
  end
 else
    flash[:alert] = "Błąd!!"
    render :new
  end
  end
end
