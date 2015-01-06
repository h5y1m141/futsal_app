require "nokogiri"
require "open-uri"
require "active_record"

class StaticPagesController < ApplicationController

	def home
    @detail = [] 
    @date = [] 
    @url = [] 
    @title = [] 
		@detail_toshi = []
		@date_toshi = []
		@url_toshi = []
		@title_toshi =[]
		@detail_nerima =[]
		@date_nerima = []
		@url_nerima = []
		@title_nerima = []


	  @maps = Map.all
	  @hash = Gmaps4rails.build_markers(@maps) do |user, marker|
		  marker.lat user.latitude
		  marker.lng user.longitude
		  marker.infowindow user.description
	  end
		
    	for i in 1..3
        url = "http://labola.jp/reserve/shop/2013/menu/personal/#{i}"
        page_source = open(url)
        doc = Nokogiri::HTML.parse(page_source,nil)
        doc.css("table.blue_table > tr").each do |elem|
          elem.css("td > a").each do |o|
				    Ochiai.create(:url => "http://labola.jp#{o[:href]}")
          end
        end
		  end
    
    items = Ochiai.find(1,2,3)

    items.each do |item| 
      page_source = open(item.url)
      doc = Nokogiri::HTML.parse(page_source,nil)
      doc.css("table.blue_table").each do |elem|
	      elem.css("tr:nth-child(5) > td").each do |o|
			   	@detail.push(o.text.scan(/[\d\-]+/))
					elem.css("tr:nth-child(2) > td").each do |x|
					  @date.push(x.text)
						elem.css("tr:nth-child(1) > td > b").each do |y|
							@title.push(y.text)
						end
		      end
				end
		  end
			@url.push(item.url)
    end

		items_toshi = Toshimaen.find(1,2,3)

    items_toshi.each do |item| 
      page_source = open(item.url)
      doc = Nokogiri::HTML.parse(page_source,nil)
      doc.css("table.blue_table").each do |elem|
	      elem.css("tr:nth-child(5) > td").each do |o|
			   	@detail_toshi.push(o.text.scan(/[\d\-]+/))
					elem.css("tr:nth-child(2) > td").each do |x|
					  @date_toshi.push(x.text)
						elem.css("tr:nth-child(1) > td > b").each do |y|
							@title_toshi.push(y.text)
						end
		      end
				end
		  end
			@url_toshi.push(item.url)
    end

		items_nerima = Nerima.find(1,2,3)

      items_nerima.each do |item| 
      page_source = open(item.url)
      doc = Nokogiri::HTML.parse(page_source,nil)
      doc.css("table.blue_table").each do |elem|
	      elem.css("tr:nth-child(5) > td").each do |o|
			   	@detail_nerima.push(o.text.scan(/[\d\-]+/))
					elem.css("tr:nth-child(2) > td").each do |x|
					  @date_nerima.push(x.text)
						elem.css("tr:nth-child(1) > td > b").each do |y|
							@title_nerima.push(y.text)
						end
		      end
				end
		  end
			@url_nerima.push(item.url)
    end
	end

	def place
	end

	def about
	end

	def contact
	end

	def news
	end

  def ochiai
    @events = Event.where(place_id: 1)
  end

	def toshimaen
		@detail = [] 
    @date = [] 
    @url = [] 
    @title = [] 
    for i in 1..3
      url = "http://labola.jp/reserve/shop/880/menu/personal/#{i}"
      page_source = open(url)
      doc = Nokogiri::HTML.parse(page_source,nil)
      doc.css("table.blue_table > tr").each do |elem|
        elem.css("td > a").each do |o|
				  Toshimaen.create(:url => "http://labola.jp#{o[:href]}")
				  #@array.push("http://labola.jp#{o[:href]}")
        end
      end
		end
    
    items = Toshimaen.all

    items.each do |item| 
      page_source = open(item.url)
      doc = Nokogiri::HTML.parse(page_source,nil)
      doc.css("table.blue_table").each do |elem|
	      elem.css("tr:nth-child(5) > td").each do |o|
			   	@detail.push(o.text.scan(/[\d\-]+/))
					elem.css("tr:nth-child(2) > td").each do |x|
					  @date.push(x.text)
				    elem.css("tr:nth-child(1) > td > b").each do |y|
						  @title.push(y.text)
					  end
		      end
				end
		  end
		@url.push(item.url)
   end
	end

	def nerima
    @detail = [] 
    @date = [] 
    @url = [] 
    @title = [] 
    for i in 1..3
      url = "http://labola.jp/reserve/shop/785/menu/personal/#{i}"
      page_source = open(url)
      doc = Nokogiri::HTML.parse(page_source,nil)
      doc.css("table.blue_table > tr").each do |elem|
        elem.css("td > a").each do |o|
				  Nerima.create(:url => "http://labola.jp#{o[:href]}")
				  #@array.push("http://labola.jp#{o[:href]}")
        end
      end
		end
    
    items = Nerima.all

    items.each do |item| 
      page_source = open(item.url)
      doc = Nokogiri::HTML.parse(page_source,nil)
      doc.css("table.blue_table").each do |elem|
	      elem.css("tr:nth-child(5) > td").each do |o|
			   	@detail.push(o.text.scan(/[\d\-]+/))
					elem.css("tr:nth-child(2) > td").each do |x|
					  @date.push(x.text)
				    elem.css("tr:nth-child(1) > td > b").each do |y|
						  @title.push(y.text)
					  end
		      end
				end
		  end
		@url.push(item.url)
    end
  end
end


