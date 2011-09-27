Factory.define :act do |a|
  a.name "Act %d"
end

Factory.define :location do |l|
  l.name "Location %d"
end

Factory.define :user do |u|
  u.name "User %d"
  u.username "username%d"
  u.sequence(:email) {|n| "user#{n}@mail.com" }
  u.password "secret"
end

Factory.define :activity do |a|
  a.association :user
  a.association :location
  a.association :act
end