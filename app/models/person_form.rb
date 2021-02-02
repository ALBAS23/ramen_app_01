class PersonForm
  include ActiveModel::Model
  attr_accessor  :nickname, :email, :gender, :prefecture_id, :f_store_one, :f_store_two, 
                 :f_store_three, :genre_id, :f_topping, :self_introduction, :user_id
  
  # def get(id)
  #   unless User.find(id).person.blank?
  #     @gender = User.find(id).person.gender
  #     @prefecture_id = User.find(id).person.prefecture_id
  #     @f_store_one = User.find(id).person.f_store_one
  #     @f_store_two = User.find(id).person.f_store_two
  #     @f_store_three = User.find(id).person.f_store_three
  #     @genre_id = User.find(id).person.genre_id
  #     @f_topping = User.find(id).person.f_topping
  #     @self_introduction = User.find(id).person.self_introduction
  #   end
  # end

  # def save
  #   if Person.find.blank?
  #     Person.create(gender: gender, f_store_one: f_store_one, f_store_two: f_store_two, f_store_three: f_store_three, genre_id: genre_id, f_topping: f_topping, self_introduction: self_introduction, user_id: user.id)
  #   else
  #     person.update(gender: gender, f_store_one: f_store_one, f_store_two: f_store_two, f_store_three: f_store_three, genre_id: genre_id, f_topping: f_topping, self_introduction: self_introduction, user_id: user.id)
  #   end
  # end
end