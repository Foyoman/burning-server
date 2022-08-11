class UsersController < ApplicationController
    before_action :check_for_admin, :only => [:index] 
    
    def index
        @users = User.all
        #    if @users
        #       render json: {
        #       users: @users
        #    }
        #   else
        #       render json: {
        #       status: 500,
        #       errors: ['no users found']
        #   }
        #  end
    end
  
    def show
        # @user = User.find(params[:id])
        #     if @user
        #        render json: {
        #        user: @user
        #     }
        #     else
        #        render json: {
        #        status: 500,
        #        errors: ['user not found']
        #     }
        #     end
    end

    def new
        @user = User.new
    end
  
    def create
        @user = User.new(user_params)

        respond_to do |format|
            if @user.save
                format.html { redirect_to @user, notice: 'User was successfully created.' }
                format.json { render :show, status: :created, location: @user }
            else
                format.html { render :new }
                format.json { render json: @user.errors, status: unprocessable_entity }
            end
        end
    end

        #     if @user.save
        #         login!  
        #         render json: {
        #         status: :created,
        #         user: @user
        #     }
        #    else 
        #        render json: {
        #        status: 500,
        #        errors: @user.errors.full_messages
        #    }
        #    end

    def update
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to @user, notice: 'User was successfully updated.' }
                format.json { render :show, status: :ok, location: @user }
            else
                format.html { render :edit }
                format.json { render json: @user.errors, status: unprocessable_entity }
            end
        end
    end

    def destroy
        @user.destroy
        respond_to do |format|
            format.html { redirect_to users_url, notice: 'User was sucessfully destroyed.' }
            format.json { head :no_content }
        end
    end
  
    private
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end