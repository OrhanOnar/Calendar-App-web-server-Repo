class Event < ApplicationRecord

enum occurence:{ biweekly:0,monthly: 1,annually:2}

def schedule

    schedule=IceCube::Schedule.new(now=start_date)  
    case occurence
    when'biweekly2'
    schedule.add_reccurence_rule IceCube::Rule.weekly(2)
    when 'monthly'
    schedule.add_reccurence_rule IceCube::Rule.monthly(1)
    when 'annually'
    schedule.add_recurrence_rule IceCube::Rule.yearly(1)
    end 
end


    validates :definition, presence: true,
                    length: { minimum: 5 }
	def self.search(search)
		if search
			where(["definition LIKE ?", "%#{search}%"])
		else
			all
		end
	end

end
# TODO: date için gün/ay/yıl gibi bir format kontrolü yapılacak
