class UserController < ApplicationController
    def index
        @user=User.all
    end
    def show
        @user=User.find(params[:id])
    end
    def new
        @user=User.new
    end
    def create
        @user=User.new(user_params)
        @user.save
        redirect_to @user
    end
    def edit
        @user=User.find(params[:id])
    end
end