module TooDead
  class List < ActiveRecord::Base
		belongs_to :user
		has_many :items
  end
end
