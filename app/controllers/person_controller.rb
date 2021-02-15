class PersonController < ApplicationController

  before_action :user_data, only: [:show, :edit, :mypost]
  before_action :move_to_root_path, only: :edit

  def show
    @person = @user.person
  end

  def edit
    @person = User.find(params[:id]).person
    if @person.blank?
      @person = Person.new
    end
  end

  def update
    if User.find(params[:id]).person.blank?
      @person = Person.new(person_params)
      if @person.save
        redirect_to "/person/#{params[:id]}"
      else
        render :edit
      end
    else
      @person = User.find(params[:id]).person
      if @person.update(person_params)
        redirect_to "/person/#{params[:id]}"
      else
        render :edit
      end
    end
  end

  def mypost
    @person_created_at = User.find(params[:id]).posts.order("created_at DESC")
    render :mypost
  end

  private

  def user_data
    @user = User.find(params[:id])
  end

  def move_to_root_path
    unless @user.id == current_user.id
      redirect_to root_path
    end
  end

  def person_params
    params.require(:person).permit(:gender, :prefecture_id, :f_store_one, :f_store_two, :f_store_three, :genre_id, :f_topping, :self_introduction).merge(user_id: params[:id])
  end
end
