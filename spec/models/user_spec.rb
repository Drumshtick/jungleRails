require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @prev_registerd_email = "first@user.com"
    @prev_registered_password = "password"
    @first_user = User.create(
      first_name: "Here",
      last_name: "First",
      email: @prev_registerd_email,
      password: @prev_registered_password,
      password_confirmation: @prev_registered_password
    )
  end

  describe 'Validations' do
    it "creates a new column" do
      @secound_user = User.create(
        first_name: "Cookie",
        last_name: "Monster",
        email: "eatdem@cookies.com",
        password: "123456",
        password_confirmation: "123456"
      )
      expect(User.all.count).to be(2)
    end

    it "doesn't create a new column if passwords don't match" do
      @secound_user = User.new(
        first_name: "Cookie",
        last_name: "Monster",
        email: "eatdem@cookies.com",
        password: "1234567",
        password_confirmation: "123456"
      )
      expect(User.all.count).to be(1)
    end

    it "doesn't create a new column if email is already registered" do
      @secound_user = User.new(
        first_name: "Cookie",
        last_name: "Monster",
        email: @prev_registerd_email,
        password: "123456",
        password_confirmation: "123456"
      )

      expect(User.where(email: @prev_registerd_email).count).to be(1)
    end

    it "doesn't create a new column if email is 
    already registered in a different case" do
      @secound_user = User.new(
        first_name: "Cookie",
        last_name: "Monster",
        email: @prev_registerd_email.upcase,
        password: "123456",
        password_confirmation: "123456"
      )
      expect(User.where(email: @prev_registerd_email).count).to be(1)
    end

    it "doesn't create a new column if email, first/last name,
     password, password_confirm is ommited" do
      @secound_user = User.new()
      expect(User.all.count).to be(1)
    end

    it "doesn't create a new column if first name is ommited" do
      @secound_user = User.create(
        last_name: "Monster",
        email: "eatdem@cookies.com",
        password: "123456",
        password_confirmation: "123456"
      ).valid?
      expect(@secound_user).to be false
    end
    
    it "doesn't create a new column if last name is ommited" do
      @secound_user = User.create(
        first_name: "Cookie",
        email: "eatdem@cookies.com",
        password: "123456",
        password_confirmation: "123456"
      )
      expect(User.all.count).to be(1)
    end

    it "doesn't create a new column if email is ommited" do
      @secound_user = User.create(
        first_name: "Cookie",
        last_name: "Monster",
        password: "123456",
        password_confirmation: "123456"
      )
      expect(User.all.count).to be(1)
    end

    it "doesn't create a new column if password is ommited" do
      @secound_user = User.create(
        first_name: "Cookie",
        last_name: "Monster",
        email: "eatdem@cookies.com",
        password_confirmation: "123456"
      )
      expect(User.all.count).to be(1)
    end

    it "doesn't create a new column if password_confirmation is ommited" do
      @secound_user = User.create(
        first_name: "Cookie",
        last_name: "Monster",
        email: "eatdem@cookies.com",
        password: "123456"
      )
      expect(User.all.count).to be(1)
    end

    it "doesn't create a new column if password doesn't
     meet minimum length (6) requirments" do
      @secound_user = User.create(
        first_name: "Cookie",
        last_name: "Monster",
        email: "eatdem@cookies.com",
        password: "123",
        password_confirmation: "123"
      )
      expect(User.all.count).to be(1)
    end

    it "doesn't create a new column if password doesn't
    meet maximum length (20) requirments" do
     @secound_user = User.create(
       first_name: "Cookie",
       last_name: "Monster",
       email: "eatdem@cookies.com",
       password: "12334567891111111111111",
       password_confirmation: "12334567891111111111111"
     )
     expect(User.all.count).to be(1)
   end
  end

  describe ".authenticate_with_credentials" do
    it "returns an authenticated user" do
      @user = User.authenticate_with_credentials(
        @prev_registerd_email, @prev_registered_password)
      expect(@user).to be_truthy
    end
    it "doesn't returns an authenticated user with bad credentials" do
      @user = User.authenticate_with_credentials(
        "bad@email.com", @prev_registered_password)
      expect(@user).to be_falsy
    end
    it "returns an authenticated user with extra whitespace in email" do
      @user = User.authenticate_with_credentials(
        "    " + @prev_registerd_email + "  ", @prev_registered_password)
      expect(@user).to be_truthy
    end
    it "returns an authenticated user when email has incorrect case" do
      @user = User.authenticate_with_credentials(
        @prev_registerd_email.upcase, @prev_registered_password)
      expect(@user).to be_truthy
    end
  end
end
