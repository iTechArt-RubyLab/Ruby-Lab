class Array
    def lab_rotate(value=1)
      step = value % self.length
      return self unless step !=self.length
       self.last(self.length - step) + self.first(step)
      end
      def lab_rotate!(value=1)
        step = value % self.length
        return self unless step !=self.length
        step.times do |i|
          self.push(self.shift)
        end
        self
      end
end
