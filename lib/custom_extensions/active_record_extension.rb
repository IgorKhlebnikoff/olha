module ActiveRecordExtension
  extend ActiveSupport::Concern

  module ClassMethods
    def filter_by(attr, value)
      where("#{attr} like '%#{value}%'")
    end

    def sort_by(attr, direction = 'DESC')
      order("#{attr} #{direction}")
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecordExtension)
