class FibonacciController < ApplicationController
	def show
		begin
			raise StandardError if !params[:n]
			raise StandardError if params[:n] !~ /^[0-9]+$/
			number = params[:n].to_i
			result = fibonacci_calc(number)
			render json: { result: result }
		rescue
			render json: { status: 400, message: "Bad request."}
		end
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