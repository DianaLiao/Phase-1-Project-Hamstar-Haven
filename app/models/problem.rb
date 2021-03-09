class Problem < ActiveRecord::Base
    has_many :solutions
    has_many :activities, through: :solutions
end