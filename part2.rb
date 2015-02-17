require 'date'

class Numeric
    @@currencies = {'yen' => 0.0065, 'euro' => 1.15, 'rupee' => 0.016}
    def method_missing(method_id, *args)
        singular_currency = method_id.to_s.gsub( /s$/, '')
        if @@currencies.has_key?(singular_currency)
            self * @@currencies[singular_currency]
        else
            super
        end
    end

    def in(currency)
        singular_currency = currency.to_s.gsub(/s$/, '')
        self / @@currencies[singular_currency]
    end
 
end

class String
    def palindrome?
        str = self.gsub(/\W/,'').downcase
        return str == str.reverse
    end
end

class DateTime
    def humanize
        hour_str = {0=>'midnight', 1=>'one', 2=>'two', 3=>'three', 4=>'four',\
                    5=>'five', 6=>'six', 7=>'seven', 8=>'eight', 9=>'nine', \
                    10=>'ten', 11=>'eleven', 12=>'twelve'}
        minute_str = {30 => 'half past', 15=> 'a quarter past', \
                      45=> 'a quarter till'}
        hour = self.strftime(format='%H').to_i
        minute = self.strftime(format='%M').to_i
        result = ''
        result << 'about' << ' ' unless minute % 15 == 0 # Precise time
        minute = minute - minute % 15
        result << minute_str[minute] << ' ' unless minute == 0
        if minute == 45 then hour = (hour + 1)% 24 end
        result << hour_str[hour]
        result.capitalize
    end
end 
