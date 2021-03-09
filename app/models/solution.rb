class Solution < ActiveRecord::Base
    belongs_to :activity
    belongs_to :problem
end