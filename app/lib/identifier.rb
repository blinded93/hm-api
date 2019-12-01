class Identifier
	def self.parse(id)
		id.include?('@') ? { email: id } : { username: id }
	end
end