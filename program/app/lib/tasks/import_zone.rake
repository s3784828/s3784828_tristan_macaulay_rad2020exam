

namespace :import_zone do
    task :new_task => :environment do
        zone_list = JSON.parse(File.read('zone.json'))

        zone_list.each do |zone|
          Zone.create(zone.to_h)
        end
    end
end