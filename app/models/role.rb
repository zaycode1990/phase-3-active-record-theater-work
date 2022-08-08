class Role < ActiveRecord::Base
    has_many :auditions
  
    def actors
      self.auditions.pluck(:actor)
    end
    def locations
      self.auditions.pluck(:location)
    end
    def lead
      if self.auditions.where(hired:true).first == nil
        "no actor has been hired for this role"
      else
        self.auditions.where(hired:true).first
      end
    end
  
    def understudy
      if self.auditions.where(hired:true).second == nil
        "no actor has been hired for understudy for this role."
      else
        self.auditions.where(hired:true).second
      end
    end
  
end
