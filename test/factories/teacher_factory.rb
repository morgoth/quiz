Factory.define :teacher do |f|
  f.sequence(:login) { |n| "teacher#{n}" }
  f.password "secret"
  f.password_confirmation {|u| u.password}
end