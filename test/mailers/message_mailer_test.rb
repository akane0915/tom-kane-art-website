require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase

  test "contact" do
    message = Message.new name: 'anna',
                          email: 'anna@example.org',
                          subject: 'hello',
                          body: 'hello, how are you doing?'

    email = MessageMailer.contact(message)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal 'Message from www.murdo.ch', email.subject
    assert_equal ['tom@tomkaneart.com'], email.to
    assert_equal ['anna@example.org'], email.from
    assert_match /hello, how are you doing?/, email.body.encoded
  end
end
