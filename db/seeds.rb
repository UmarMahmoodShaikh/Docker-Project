require 'faker'
puts "My Fake data is here"
require 'thread'
def newUser
    #id = Faker::Number.between(from: 10, to: 500)
    name = Faker::Name.name
    email = Faker::Internet.free_email
    password_digest = Faker::Internet.password
    created_at = '2022-07-13 13:26:11.671'
    updated_at = '2022-07-13 13:26:11.671'
    ip = Faker::Internet.ip_v4_address
    {name: name, email: email, password_digest: password_digest, created_at: created_at, updated_at: updated_at, ip: ip}
end

def prepare
    content = Faker::Lorem.sentence(word_count: 5)
    author = Faker::Name.name
    title= Faker::Movie.title
    rate = Faker::Number.between(from: 1, to: 5)
    user_id = Faker::Number.between(from: 1, to: 10)
    # id = Faker::Number.number(digits: 3) #=> 669
    created_at = '2022-07-13 13:26:11.671'
    updated_at = '2022-07-13 13:26:11.671'
    {title: title, author: author, content: content, rate: rate, user_id: user_id, created_at: created_at, updated_at: updated_at}
end

count = 0
arr = []

40.times do |i|
   arr[i] = Thread.new {
    # sleep(1)
      Thread.current["mycount"] = count
      count += 1
      @post = Post.create(prepare)
      #@user = User.create(newUser)
   }
end

arr.each {|t| t.join; print t["mycount"], ", " }
puts "count = #{count}"
