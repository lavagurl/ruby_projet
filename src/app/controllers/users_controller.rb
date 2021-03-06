class UsersController < ApplicationController
    before_action :authenticate_user!

# GET /users
# GET /users.json
    def index
      authorize! :manage, User
        @users = User.all
    end

# GET /users/1
# GET /users/1.json
    def show
    end

# GET /users/new
    def new
        @user = User.new
    end

# GET /users/1/edit
    def edit

    end

    def change_status_admin
      authorize! :update, Movie
      @user = User.find(params[:id])
      @user.update admin: true
      redirect_to '/users'
    end

    def change_status_user
      authorize! :manage, Movie
      @user = User.find(params[:id])
      @user.update admin: false
      redirect_to '/users'
    end

# POST /users
# POST /users.json
    def create
        @user = User.new(user_params)
        puts user_params
        puts @user.add_roles(user_params)
        respond_to do |format|
            if @user.save
                format.html { redirect_to @user, notice: 'User was successfully created.' }
                format.json { render :show, status: :created, location: @user }
            else
                format.html { render :new }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

# PATCH/PUT /users/1
# PATCH/PUT /users/1.json
    def update
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to @user, notice: 'User was successfully updated.' }
                format.json { render :show, status: :ok, location: @user }
            else
                format.html { render :edit }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

# DELETE /users/1
# DELETE /users/1.json
    def destroy
        @user.destroy
        respond_to do |format|
            format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Only allow a list of trusted parameters through.
    def user_params
        params.require(:user).permit(:role_ids)
    end


end
