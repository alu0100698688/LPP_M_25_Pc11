class Answer
    attr_accessor :kind, :order, :answer
    
      # order:  the position of the answer in the question
      # kind:   either :right or :wrong
      # answer: the text of the answer (for instance "1492")
      def initialize(order, kind, answer)
        @kind, @order, @answer = kind, order, answer
      end
    
      def to_s
        "#{@order}. #{answer}"
      end
    
      # decides if this is a right answer
      def is_right?
        @kind == Quiz::RIGHT
      end
    
      # Answer objects must be sorted according to their position
      # inside the question
      def <=>(other)
        self.order <=> other.order
      end
end