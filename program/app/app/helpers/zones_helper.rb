module ZonesHelper
    def get_possible_cities
        @possible_cities = []
        Zone.all.each do |zone|
            utc = zone.utc
        #utc.to_s
            #@possible_cities << utc

            utc.each do |city|  
                puts city.to_s
                @possible_cities << city.to_s
                print @possible_cities
                #array = city.split(/"/"/)
                #puts array
            end
        end
        #@possible_cities = Zone.all.utc
    end
end
