class UsersController < ApplicationController
  def index  
  end
 
    def create 
        client_params = user_params
        client_params['ip'] = request.remote_ip
        user=User.new(client_params)
        if user.save 
            session[:user_id]= user.id
            session[:user_name]= user.name
            # puts "HELLO I'M FAKE I MEAN MY NAME IS FAKE BUT I DO REAL THINGS"
            # def prepare
            #     title = Faker::Book.title
            #     author = Faker::Book.author
            #     content = Faker::Hipster.sentence(4)
            #     id = Faker::Number.between(10,2000)
            #     {title: title, author: author, content: content, id: id}
            # end
            # 3.times do 
            #     book = Book.create(prepare)
            # end
            redirect_to '/posts'
        else 
            flash[:register_errors] = user.errors.full_messages
            redirect_to '/'
        end
    end
    private 
    def user_params
      
       params.require(:user).permit(:name, :email , :password, :password_confirmation)
    end     
end


# INSERT INTO PUBLIC.SHOPPERS(ID, PHONE, NAME, EMAIL, PASS)VALUES(, '', '', '', '');


# INSERT INTO PUBLIC.SHOPPERS(ID, PHONE, NAME, EMAIL, PASS)VALUES(Faker::Number.rand_in_range(5,20), Faker::PhoneNumber.cell_phone, Faker::Name.name, Faker, Faker::Internet.email, Faker::Internet.password)