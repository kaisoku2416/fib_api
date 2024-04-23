class FibonacciController < ApplicationController
	def show
    number = params[:n].to_i
    result = fibonacci_calc(number)
    render json: { number: result }
  end

  private
  def fibonacci_calc(n)
    a,b,c=1,1,1
    (n-2).times do
			c=a+b
      a,b=b,c
    end
    c
	end
end