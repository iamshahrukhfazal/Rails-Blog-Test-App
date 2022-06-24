class PostPolicy < ApplicationPolicy
   
    def index? 
      # byebug
      # ["moderator"].include?(@user.role)
      true
    end

    def show? 
      # ["moderator"].include?(@user.role)
      true
    end
  
end
                                                                                                                                                                                                                                                                                        
                                                                                                                                                    
    
   
   
   
5