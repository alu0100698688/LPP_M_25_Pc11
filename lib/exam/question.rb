class Question
    attr_reader :ask,:difficulty
    def initialize(ask,difficulty=0)
        @ask,@difficulty = ask,difficulty
    end 
    
end