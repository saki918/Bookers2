class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

	# validates :name, presence: true, length: { in: 2..20 }
	
end
