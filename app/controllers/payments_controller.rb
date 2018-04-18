class PaymentsController < ApplicationController

  def create 

  	@product = params[:product_id]

  	@user = current_user

  	token = params[:stripeToken]
	  # Create the charge on Stripe's servers - this will charge the user's card
	  begin
	    charge = Stripe::Charge.create(
	      amount: @product.price*100, # amount in cents, again
	      currency: "GBP",
	      source: token,
	      description: params[:stripeEmail],
	      receipt_email: params[:stripeEmail]
	    )

	    if charge.paid
	      Order.create(
	        product_id: @product.id,
	        user_id: @user.id,
	        total: @product.total
	      )	
	  
	  redirect_to 'payments/create'

	  end



	  rescue Stripe::CardError => e
	    # The card has been declined  
	    body = e.json_body
	    err = body[:error]
	    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]} Please contact your bank"
		puts "Error code is #{err[:code]}" if err[:code]		    
		puts "Decline code is: #{err[:decline_code]}" if err[:decline_code]
  		puts "Error with: #{err[:param]}" if err[:param]
  		puts "Message is: #{err[:message]}" if err[:message]

  		redirect_to product_path(@product)

	  end

  end

end