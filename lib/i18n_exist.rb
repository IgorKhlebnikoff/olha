module I18n_exist
  I18n.class_eval do
    class << self
      def exist?(key)
        !self.t(key).include?("translation missing")
      end
    end
  end
end
