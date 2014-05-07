require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'uri'
require 'json'

namespace :app do
  desc "Scrape shows"
  task :scrape_shows => :environment do
    stupid_array = Array.new(5146, "bar")
    array_of_show_ids = Array.new
    stupid_array.each_index { |x| array_of_show_ids.push(x) }
    array_of_show_ids.delete_if { |id| id < 903 }



array_of_show_ids.each { |show_id|
  url = "http://www.stageagent.com/Shows/View/#{show_id}"
  resp = Net::HTTP.get_response(URI.parse(url))
  if resp.code.match(/20\d/)
    page = Nokogiri::HTML(open("http://www.stageagent.com/Shows/View/#{show_id}"))
    title = page.css('.orange_title strong')[0].text
    type_of_show = page.css('table')[1].css('tr')[0].css('td.gray12')[1].text

    if type_of_show == "Opera" || type_of_show == "Musical" || type_of_show == "Play"

    # if type_of_show == "Opera"
    #   author = ""
    # else
    #   author = page.css('table')[1].css('tr')[1].css('td')[1].text
    # end

    # if type_of_show == "Musical"
    #   music_by = page.css('table')[1].css('tr')[2].css('td')[1].text
    # elsif type_of_show == "Opera"
    #   music_by = page.css('table')[1].css('tr')[1].css('td')[1].text
    # else
    #   music_by = ""
    # end

    # if page.css('table')[1].css('tr')[1].css('td')[1] != nil
    #   author = page.css('table')[1].css('tr')[1].css('td')[1].text
    # else
    #   author = ""
    # end


      {
        :title => title,
        :type_of_show => type_of_show,
      }

     play = Play.new(:title => title, :type_of_show => type_of_show)

      if play.save
       puts play.title
      end

    if page.css('table')[3]
      roles = page.css('table')[3].css('a.blue')
      number_of_roles = roles.count
      numbers = Array.new(number_of_roles, "foo")
      array = Array.new
      numbers.each_index { |x| array.push(x) }

    # puts title.upcase
    # puts type_of_show.upcase
    # puts author
    # puts music_by
    # puts "___________"

    # array.each { |x| puts roles[x].text }

    # puts "**********"

      roles_array = Array.new

      array.each { |x| roles_array.push(roles[x].text) }

    # puts roles_array

    # puts show_id

      roles_array.each { |role|
        character_name = role
        play_id = play.id

        {
          :character_name => character_name,
          :play_id => play_id,
        }

        role = Role.new(:character_name => character_name, :play_id => play_id)

        if role.save
          puts role.character_name
        end

      }
    end

    end

  end

  }
  end

  desc "Scrape Theatres"
  task :scrape_theatres => :environment do

    # array of search pages
    array = [0, 9, 18, 27, 36, 45, 54, 63, 72, 81, 90, 99, 108]

    array.each { |search_num|

    # 1) set url and number of listings
    url = "http://www.chicagoplays.com/component/theatre/?view=searchlist&start=#{search_num}"
    page = Nokogiri::HTML(open(url))
    listings_on_page = page.css('div.theatreListingText')
    number_of_listings_on_page = listings_on_page.count

    #2) create array of each listing id
    stupid_array = Array.new(number_of_listings_on_page, "bar")
    array_of_listing_ids = Array.new
    stupid_array.each_index { |x| array_of_listing_ids.push(x) }

    #3) cycle through listings
    array_of_listing_ids.each { |listing_id|

    listing = page.css('div.theatreListingText')[listing_id]

    number_of_divs = listing.css('div').count
    name = listing.css('h1').text

    if listing.css('div').css('b')
        theatre_type = listing.css('div').css('b').text
      if theatre_type == ""
        theatre_type = nil
      end
    end


    city = "Chicago, IL"

      {
        :name => name,
        :theatre_type => theatre_type,
        :city => city
      }

    theatre = Theatre.new(:name => name, :theatre_type => theatre_type, :city => city)

    if theatre.save
      puts theatre.name
    end

    puts "****************"

    }

    }

  end
end
