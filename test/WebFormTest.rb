require "./base/WebFormUtil.rb"
require "test/unit"

class WebFormTest < Test::Unit::TestCase

	def setup
    	@web_form_util = WebFormUtil.new
	end

	def test_blank_form_submission
		error_message_name_field, error_message_deployment_field = @web_form_util.verify_blank_form_submission
    	assert_equal("This is a required question", error_message_name_field)
    	assert_equal("This is a required question", error_message_deployment_field)
    end

    def test_successful_form_submission
    	assert_equal("Your response has been recorded.", @web_form_util.verify_successful_form_submission)
    end

    def teardown
    	@web_form_util.closeWebForm
  	end

end


