
#   Users accounts
users = 5.times do 
  User.create(
    firstname: FFaker::Name.firstname, 
    lastname: FFaker::Name.lastname,
    email: FFaker::Internet.email,
    password: 'test1234',
    password_confirmation: 'test1234'
  )
end

#admin
admin = User.create(
  firstname: 'Janko',
  lastname: 'Muzykant',
  emial: 'admin@example.com',
  password: 'test1234',
  password_confirmation: 'test_1234',
  admin: true
)

