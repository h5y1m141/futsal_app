class Nerima < ActiveRecord::Base
	validates :url, uniqueness: true
end
