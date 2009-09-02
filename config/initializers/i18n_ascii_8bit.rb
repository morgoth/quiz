module I18n
  module Backend
    class Simple
      def load_yml(filename)
        traverse(YAML::load(IO.read(filename))) { |o| o.force_encoding(Encoding::ASCII_8BIT) if o.respond_to?(:force_encoding) }
      end

      def traverse(object, &block)
        if object.kind_of? Hash
          object.each_value { |o| traverse(o, &block) }
        elsif object.kind_of? Array
          object.each { |o| traverse(o, &block) }
        else
          yield object
        end
        object
      end
    end
  end
end
