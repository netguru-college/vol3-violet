class Group < ApplicationRecord
    validates_presence_of :name
    validates :name, length: { in: 5..255 }
end