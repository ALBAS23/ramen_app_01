class Genre < ActiveHash::Base
  sele.data = [
    { id: 1, name: '--' }, { id: 2, name: '味噌' }, { id: 3, name: '醤油' }, { id: 4, name: '塩' }, { id: 5, name: 'とんこつ' }, 
    { id: 6, name: 'つけ麺' }, { id: 7, name: '油そば' }, { id: 8, name: '鶏白湯' }, { id: 9, name: '二郎系' }, { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
end