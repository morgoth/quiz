Factory.define :student do |f|
  f.sequence(:login) { |n| "student#{n}" }
  f.password "secret"
  f.password_confirmation {|u| u.password}
end