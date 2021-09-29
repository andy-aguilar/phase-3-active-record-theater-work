class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        # self.auditions.map{|audition| audition.actor}
        auditions.pluck(:actor)
    end

    def locations
        auditions.pluck(:location)
    end

    def lead
        hired = self.auditions.find_by(hired: true) || "no actor has been hired for this role"
    end

    def understudy
        #get all of the auditions for this role where the hired attribute is true
        
        self.auditions.where(hired: true).second|| "no actor has been hired for understudy for this role"

        #if there's a second one, return it, otherwise return "no actor..."
    end

end