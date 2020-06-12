class City < ApplicationRecord

    has_one :selected_city

    def update_time
        update_attribute(:time, Time.current)
        update_attribute(:time, offset.hour.from_now)
    end

    def update_time_status
        if (time.hour >= 9 and time.hour < 18)
            update_attribute(:time_status, "Buisness Time") 
        elsif (time.hour >= 18 and time.hour < 20)
            update_attribute(:time_status, "Buisness Overtime") 
        elsif (time.hour >= 8 and time.hour < 9 or time.hour >= 20 and time.hour < 23)
            update_attribute(:time_status, "Person Time")
        elsif (time.hour >= 23 or time.hour < 8)
            update_attribute(:time_status, "Sleeping Time")
        end
    end

    def update_time_difference default_city
        time_difference = default_city.time.hour - time.hour
        update_attribute(:time_difference, default_city.time.hour - time.hour)
    end

end
