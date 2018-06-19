class EventType < ApplicationRecord
    has_many :fields, class_name: "EventField", :dependent => :delete_all 
    accepts_nested_attributes_for :fields, allow_destroy: true
end
