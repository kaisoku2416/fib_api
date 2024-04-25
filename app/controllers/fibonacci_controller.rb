class FibonacciController < ApplicationController
  def show
    begin
      #パラメータにnが正しく含まれているか、nが整数かを判定
      raise TypeError if !params[:n]
      raise TypeError if params[:n] !~ /^-?[0-9]+$/

      #正しい場合の処理
      number = params[:n].to_i
      raise RangeError if number<=0 || number>=1_000_000 #nの範囲を指定
      render json: { result: fibonacci_calc(number) }
    rescue TypeError
      render json: { status: 400, message: "Bad request."}
    rescue RangeError
      render json: { status: 416, message: "Request Range Not Saticfiable."}
    end
  end

  private
  def fibonacci_calc(n)
    a,b,c=1,1,1
    (n-2).times do
      c=a+b
      a,b=b,c
    end
    return c
  end
end