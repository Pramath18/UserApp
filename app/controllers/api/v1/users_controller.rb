class Api::V1::UsersController < ApplicationController
before_action :getUser, only: [:updateUser, :deleteUser]    
    
    
    def getUsers
        user = User.all
        if user
            render json: user, status: :ok
        else
            render json: {msg: "user Empty"},status: :unprocessable_entity
        end

    end

    def addUser
        user = User.new(firstname: params[:firstname],lastname: params[:lastname], email: params[:email])

        if user.save()
            render json: user, status: :ok
        else
            render json: {message: "User not added"}, status: :unprocessable_entry
        end
    end

    def showUser
        if @user
            render json: user, status: :ok
        else
            render json: {msg: "user not Found"},status: :unprocessable_entity
        end
    end

    def updateUser
        if @user
            if @user.update(userparams)
                render json: user, status: :ok
            else
                render json: {msg: "Update Failed"},status: :unprocessable_entity
            end
        else
            render json: {msg: "User not found"},status: :unprocessable_entity
        end
    end

    def deleteUser
        if @user
            if @user.destroy()
                render json: {msg: "User Deleted"}, status: :ok
            else
                render json: {msg: "Update Failed"},status: :unprocessable_entity
            end
        else
            render json: {msg: "User not found"},status: :unprocessable_entity
        end
    end
    def search
        @guides = Guide.search(params[:query])
    
        render json: @guides
      end
    private
    def userparams
        params.permit(:firstname,:lastname,:email);
    end
    def getUser
        @user = User.find(params[:id])
    end
  
   
end
