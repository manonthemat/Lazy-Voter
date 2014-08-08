class Proposition
  include Mongoid::Document
  field :propid, type: Integer
  field :whatitmeans, type: String
  field :whatyouthink, type: String
  field :howtovote, type: String
  field :why, type: String
  field :date, type: String
  field :location, type: String
  field :comment, type: String
  
  
  
  belongs_to :ballot
  has_many :comments
end
