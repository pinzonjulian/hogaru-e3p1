require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "view_stats" do
    mail = UserMailer.view_stats
    assert_equal "View stats", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
