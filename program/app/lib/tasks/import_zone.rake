

namespace :import_zone do
    task :new_task => :environment do
        zone_list = JSON.parse(File.read('zone.json'))

        zone_list.each do |zone|
          Zone.create(zone.to_h)
        end

        Zone.all.each do |zone|
          new_resource = Resource.new
          new_resource.offset = zone.offset.to_f
          zone.utc.each do |city|
            string = city.split('/')
            if string[0] != "Etc" and !string[1].nil?
                new_resource.city_name = string[1].downcase
                new_resource.save
            end
          end
        end
    end
end