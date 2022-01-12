require "rails_helper"

RSpec.describe OrderReciept, type: :mailer do

  before :each do
    @order = Order.new
      email: 'ekodnar@ex.com',
      total_cents: 2600,
      stripe_charge_id: 'xxxxxxxxxxxxxxxxxxxxxxxxx'
    )
  end
  describe "thanks_for_shopping" do
    let(:mail) { OrderReciept.thanks_for_shopping(Order.last) }

    it "renders the headers" do
      expect(mail.subject).to eq("Thanks for shopping")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
