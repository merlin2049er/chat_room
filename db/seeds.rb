# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


rooms = Room.create([
  {
    name: "Politics",
    subject: "Brett Kavanaugh Hearing"
  },
  {
    name: "Entertainment",
    subject: "Music Production"
  },
  {
    name: "Hobbies",
    subject: "Yoyo"
  },
  {
    name: "School",
    subject: "Harvard Law"
  },
  {
    name: "Music",
    subject: "Blink 182"
  }
])

password = "sbishop0619"
users = User.create([
  {
    name: "Michael",
    email: "sbishop0930+1@gmail.com",
    password: password,
    password_confirmation: password
  },
  {
    name: "Pam",
    email: "sbishop0930+2@gmail.com",
    password: password,
    password_confirmation: password
  },
  {
    name: "Dwight",
    email: "sbishop0930+3@gmail.com",
    password: password,
    password_confirmation: password
  }

])

rooms.each do |room|
  Message.create([
    {
      user_id: users.first.id,
      room_id: room.id,
      body: " Vinyl subway tile lumbersexual dreamcatcher chicharrones PBR&B viral before they sold out kinfolk tacos. Squid beard offal meditation, PBR&B "
    },
    {
      user_id: users.second.id,
      room_id: room.id,
      body: "cleanse polaroid leggings scenester kombucha gochujang chicharrones fingerstache umami bitters. Vinyl subway tile lumbersexual dreamcatcher chicharrones PBR&B viral before they sold out kinfolk tacos. Squid beard offal meditation, PBR&B "
    },
    {
      user_id: users.third.id,
      room_id: room.id,
      body: "Lorem ipsum dolor amet chillwave master cleanse polaroid leggings scenester kombucha gochujang chicharrones fingerstache umami bitters. Vinyl subway tile lumbersexual dreamcatcher chicharrones PBR&B viral  Squid beard offal meditation, PBR&B "
    }
  ])
end
