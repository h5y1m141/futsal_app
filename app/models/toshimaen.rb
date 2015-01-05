class Toshimaen < ActiveRecord::Base
	validates :url, uniqueness: true
end
