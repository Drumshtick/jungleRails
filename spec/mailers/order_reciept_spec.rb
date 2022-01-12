require "rails_helper"

RSpec.describe OrderReciept, type: :mailer do
  describe "thanks_for_shopping" do
    let(:mail) { OrderReciept.thanks_for_shopping }

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
