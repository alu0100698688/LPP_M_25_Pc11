require_relative "../lib/quiz/question.rb"

class Quiz
    WRONG = :wrong
    RIGHT = :right
    attr_accessor :name, :questions    
    
    def initialize(name="",&block)
       self.name = name
       self.questions =[]
       
       @counter = 0
       instance_eval &block
   
    end
    
    def question(text,answers)
       q = Question.new(text,answers)
       @questions << q
       @counter = 0 
    end
    
    
    def wrong
        @counter += 1
        [@counter, WRONG]
    end
    
    def right
        @counter +=1
        [@counter, RIGHT]
    
    end
    
    def to_s
        
        cadena = ""
		@questions.each do |m,i| 
       		cadena += "#{m}"
      	end
      	cadena
  
    end
    
    def checkAnswers(answersUser)
       count = 0
       i = 0
       @questions.each do |q|
          
          if q.check(answersUser[i])
             count +=1
          end
          i +=1
           
       end 
       "Resultado: #{count}/#{@questions.size}"
        
    end


end