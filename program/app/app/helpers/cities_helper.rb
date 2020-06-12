module CitiesHelper

    def cities_for_select
        @options_for_select = []
        City.all.each do |city|
            @options_for_select << [city.name, city.id]
        end
    end
end
