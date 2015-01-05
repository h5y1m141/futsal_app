class Ochiai < ActiveRecord::Base
	validates :url, uniqueness: true
end
