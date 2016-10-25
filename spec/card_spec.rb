require 'card'

describe Card do
  subject do
    Card.new(suit_name, value_number)
  end

  context "basic properties" do
    let(:suit_name) { :spades }
    let(:value_number) { 14 }

    it 'has a name' do
      expect(subject).to respond_to(:name)
    end

    it 'has a suit' do
      expect(subject).to respond_to(:suit)
    end

    it 'has a value' do
      expect(subject).to respond_to(:value)
    end
  end

  describe "converting numerical values to text if necessary" do
    let(:suit_name) { :clubs }

    context "non face cards" do
      let(:value_number) { 10 }
      it 'leaves it as it is' do
        expect(subject.name).to eq "10 of Clubs"
      end
    end

    context "jack" do
      let(:value_number) { 11 }

      it 'converts 11 to jack' do
        expect(subject.name).to eq "Jack of Clubs"
      end
    end

    context "queen" do
      let(:value_number) { 12 }

      it 'converts 12 to queen' do
        expect(subject.name).to eq "Queen of Clubs"
      end
    end

    context "king" do
      let(:value_number) { 13 }

      it 'converts 13 to king' do
        expect(subject.name).to eq "King of Clubs"
      end
    end

    context "ace" do
      let(:value_number) { 14 }

      it 'converts 14 to ace' do
        expect(subject.name).to eq "Ace of Clubs"
      end
    end
  end

end