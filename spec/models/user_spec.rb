require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @prev_registerd_email = "first@user.com"
    @first_user = User.create(
      first_name: "Here",
      last_name: "First",
      email: @prev_registerd_email,
      password: "password",
      password_confirmation: "password"
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
      @secound_user = User.create(
        first_name: "Cookie",
        last_name: "Monster",
        email: "eatdem@cookies.com",
        password: "12345",
        password_confirmation: "123456"
      )
      expect(User.all.count).to be(1)
    end

    it "doesn't create a new column if email is already registered" do
      @secound_user = User.create(
        first_name: "Cookie",
        last_name: "Monster",
        email: @prev_registerd_email,
        password: "123456",
        password_confirmation: "123456"
      )
      puts User.all.count.inspect
      expect(User.all.count).to be(1)
    end

    it "doesn't create a new column if email is 
    already registered in a different case" do
      @secound_user = User.create(
        first_name: "Cookie",
        last_name: "Monster",
        email: @prev_registerd_email.upcase,
        password: "123456",
        password_confirmation: "123456"
      )
      expect(User.all.count).to be(1)
    end

    it "doesn't create a new column if email, first/last name,
     password, password_confirm is ommited" do
      @secound_user = User.create()
      expect(User.all.count).to be(1)
    end

    it "doesn't create a new column if first name is ommited" do
      @secound_user = User.create(
        last_name: "Monster",
        email: @prev_registerd_email,
        password: "123456",
        password_confirmation: "123456"
      )
      expect(User.all.count).to be(1)
    end
    
    it "doesn't create a new column if last name is ommited" do
      @secound_user = User.create(
        first_name: "Cookie",
        last_name: "Monster",
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
     meet minimum length requirments" do
      @min_password_length = 6
      @secound_user = User.create(
        first_name: "Cookie",
        last_name: "Monster",
        email: "eatdem@cookies.com",
        password: "123",
        password_confirmation: "123"
      )
      expect(User.all.count).to be(1)
    end
  end
end
