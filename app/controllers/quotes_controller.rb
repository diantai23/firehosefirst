class QuotesController < ApplicationController

 ## Randomizes the existing list and display the first item
  def index
    @quote = Quote.order("RANDOM()").first
  end

## Creates a new empty row for a new quote
  def new
    @quote = Quote.new
  end

## Sends the saying and author parts to the database so they are saved
  def create
    Quote.create(quote_params)
    redirect_to root_path
  end

  private

## Pulls the values of saying and author from the quotes form
## Ensures form is secure from random entries into the database
  def quote_params
    params.require(:quote).permit(:saying, :author)
  end

end
