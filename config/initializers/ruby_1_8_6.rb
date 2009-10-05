unless Symbol.method_defined?(:to_proc)
  class Symbol
    def to_proc
      return Proc.new {|*args| args.shift.send(self, *args) }
    end
  end
end

unless Array.method_defined?(:shuffle)
  class Array
    def shuffle
      self.sort_by { Kernel.rand }
    end
  end
end

unless Array.method_defined?(:count)
  class Array
    def count
      self.size
    end
  end
end