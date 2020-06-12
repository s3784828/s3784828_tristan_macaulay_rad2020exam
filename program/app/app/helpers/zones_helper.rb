module ZonesHelper
    def get_possible_cities
        @possible_cities = []
        @possible_cities_better = []
        Zone.all.each do |zone|
            utc = zone.utc
        #utc.to_s
            #@possible_cities << utc

            utc.each do |city|  
                #puts city.to_s
                @possible_cities << city.to_s
            end

            @possible_cities.each do |city|
                puts city
                @possible_cities_better << city.split('/')
                print @possible_cities_better
            end
        end
    end
end
