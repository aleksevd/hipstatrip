require "spec_helper"

describe "Visible Proposals" do
  let!(:owner) { create(:user) }
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:user3) { create(:user) }
  let!(:proposal1) { create(:proposal, sender: user1, receiver: owner, trip: trip) }
  let!(:proposal2) { create(:proposal, sender: user2, receiver: owner, trip: trip) }
  let!(:proposal3) { create(:proposal, sender: user3, receiver: owner, trip: trip2)}

  shared_examples_for "Proposal visibility" do
    context "when the User is Trip owner" do

      before do
        login_as(owner)
        visit "/trips/#{trip.id}"
      end

      specify "he can see all Proposals of this Trip" do
        page.should have_content(user1.email)
        page.should have_content(user2.email)
      end

      specify "he cannot see other Trip Proposals" do
        page.should_not have_content(user3.email)
      end
    end

    context "when the User is Proposal owner" do

      before do
        login_as(user1)
        visit "/trips/#{trip.id}"
      end

      specify "he can see own Proposals" do
        page.should have_content(user1.email)
      end

      specify "he cannot see Proposals of other Users" do
        page.should_not have_content(user2.email)
      end

      specify "he cannot see Proposals from another Trips" do
        page.should_not have_content(user3.email)
      end
    end
  end

  context "when the Trip is owned by a Driver" do
    let!(:trip) { create(:trip, driver: owner) }
    let!(:trip2) { create(:trip, driver: owner) }
    it_behaves_like "Proposal visibility"
  end

  context "when the Trip is owned by a Passenger" do
    let!(:trip) { create(:trip, passengers: [owner]) }
    let!(:trip2) { create(:trip, driver: owner) }
    it_behaves_like "Proposal visibility"
  end
end
