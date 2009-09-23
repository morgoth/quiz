teacher = Teacher.new :login => 'teacher', :password => 'secret', :password_confirmation => 'secret'
if teacher.save
  puts "You can login now. Login: teacher, password: secret"
else
  puts teacher.errors.full_messages.each { |e| "#{e}\n" }
end