class City < ApplicationRecord

    def display_time standard_format
        if standard_format
            time.strftime("%H:%M")
        else 
            if (time.hour > 12)
                temp_time = time
                temp_time = time - 12.hour
                temp_time.strftime("%H:%M PM")
            else
                time.strftime("%H:%M AM")
            end
        end
    end
            

    def make_default
        update_attribute(:default, true)
    end

    def remove_default
        update_attribute(:default, false)
    end

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
            update_attribute(:time_status, "Personal Time")
        elsif (time.hour >= 23 or time.hour < 8)
            update_attribute(:time_status, "Sleeping Time")
        end
    end

    def update_day_status default_city
        day_difference = time.day - default_city.time.day
        if (day_difference == 0)
            update_attribute(:day_status, "today") 
        elsif (day_difference < 0)
            update_attribute(:day_status, "yesterday")
        elsif (day_difference > 0)
            update_attribute(:day_status, "tommorow")
        end
    end

    def update_time_difference default_city
        time_difference = time - default_city.time
        time_difference /= 60
        time_difference /= 60
        update_attribute(:time_difference, time_difference.round)
    end

end
