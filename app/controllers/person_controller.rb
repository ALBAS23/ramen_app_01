class PersonController < ApplicationController
  def show
    @user = User.find(params[:id])
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

  private

  def person_params
    params.require(:person).permit(:gender, :prefecture_id, :f_store_one, :f_store_two, :f_store_three, :genre_id, :f_topping, :self_introduction).merge(user_id: params[:id])
  end
end
