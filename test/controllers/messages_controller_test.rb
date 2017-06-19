require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest

  test "GET new" do
    get new_message_url

    assert_response :success

    assert_select 'form' do
      assert_select 'input[type=text]'
      assert_select 'input[type=text]'
      assert_select 'input[type=email]'
      assert_select 'textarea'
      assert_select 'input[type=submit]'
    end
  end

  test "POST create" do
      assert_difference 'ActionMailer::Base.deliveries.size', 1 do
        post create_message_url, params: {
          message: {
            name: 'cornholio',
            email: 'cornholio@example.org',
            subject: 'test',
            body: 'hai'
          }
        }
      end

      assert_redirected_to new_message_url

      follow_redirect!

      assert_match /Your message was successfully sent!/, response.body
    end

  test "invalid POST create" do
    post create_message_url, params: {
      message: { name: '', email: '', subject: '', body: '' }
    }

    assert_match /Name .* blank/, response.body
    assert_match /Email .* blank/, response.body
    assert_match /Subject .* blank/, response.body
    assert_match /Body .* blank/, response.body
  end
end
