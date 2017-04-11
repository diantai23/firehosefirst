class QuotesController < ApplicationController

 ## Randomizes the existing list and display the first item
  def index
    @quote = Quote.order("RANDOM()").first
  end



## Sends the saying and author parts to the database so they are saved
  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end
    redirect_to root_path
  end

  def about
    
  end


  private

## Pulls the values of saying and author from the quotes form
## Ensures form is secure from random entries into the database
  def quote_params
    params.require(:quote).permit(:saying, :author)
  end

end
