class ProductsController < ApplicationController
  
  def index
   @produts = Product.all.limit(15)
  end

  def single
	@produt=Product.find(params[:id])
  end

  def woman_product
  	@produts =   Category.find_by(name: "Women").products
  end

  def man_product
  	@produts =   Category.find_by(name: "Men").products
  end

  def other
    @produts =   Category.find_by(name: "Other").products
  end

  def login

  end

  def buy
    if session[:current_user_id]
       redirect_to root_path
    else
      render 'login'
    end
  end

  def check_user
  		if @user=User.find_by(email: params[:email],password: params[:password])
  		 session[:current_user_id]=@user.id
  		 redirect_to root_path
	  	else
	  		render 'login'
	  	end
  end

  def register

  end

  def save_user
		@user=User.new(user_param)
		if @user.save
		 	 session[:current_user_id]=@user.id
			 redirect_to root_path
		else
			render 'register'
		end
  end


  private
	def user_param
		params.permit(:first_name,:last_name,:email,:password,:address,:city,:phone)
	end


end
