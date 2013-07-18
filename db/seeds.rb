# Add roles

roles = %w(admin buyer)

roles.each do |name|
  unless Role.find_by_name(name)
    Role.create(name: name)
  end
end
