Given(/^there are (\d+) (\w+) Subscriptions$/) do |count, channel|
  create_list(:subscription, count, publisher: (Publisher.first || create(:publisher)), channel: channel.downcase)
end

Then(/^I should see '(\d+) (\w+) Subscriptions'$/) do |count, channel|
  expect(page).to have_content "#{count} #{channel} Subscriptions"
end
