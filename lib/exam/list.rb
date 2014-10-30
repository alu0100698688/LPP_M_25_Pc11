require_relative "node.rb"
class List
   
   def initialize(nodoCabeza)
       @cabeza = nodoCabeza
   end
   def pullHead
      @cabeza = @cabeza[:next]
   end
    
end