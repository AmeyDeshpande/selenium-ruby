require 'selenium-webdriver'

require 'yaml'

class WebFormUtil

	#author : Amey Deshpande
	#code written on : Oct 26, 2016

	#initialize method is a constructor method
	def initialize
	  	@driver = Selenium::WebDriver.for :firefox
	 	@urlForVerification = "https://docs.google.com/forms/d/e/1FAIpQLSeT6MPuoZm8Ks3TUw9j3lTKeUlwvcVseFeear6OF4ey24Q40g/viewform"
	  	@objRepo = YAML.load_file("../GUI/base/ObjectRepository.yml")
	end 
	
	#Following method is writtern to verify negetive test case. 
	#This mehod verifies the error messages if user tries to submit blank form  
	def verify_blank_form_submission
		@driver.get(@urlForVerification)
		@driver.find_element(:xpath, @objRepo['submit_button']).click
		@driver.find_element(:id, @objRepo['text_area']).click

		error_message_name_field = @driver.find_element(:xpath, @objRepo['error_message_1']).text
		error_message_deployment_field = @driver.find_element(:xpath, @objRepo['error_message_2']).text
		return error_message_name_field, error_message_deployment_field	

	end

	#Following method is written to verify valid test case.
	#This method submits form with valid data and confirms success message on next page.
	def verify_successful_form_submission
		@driver.get(@urlForVerification)
		@driver.find_element(:id, @objRepo['name_text_box']).send_keys("Test_User")
		@driver.find_element(:xpath, @objRepo['checkbox_yes']).click
		@driver.find_element(:xpath, @objRepo['click_drop_down']).find_element(:xpath, @objRepo['select_rspec']).click
		sleep 2
		@driver.find_element(:id, @objRepo['text_area']).send_keys("This is automation testing using Ruby")
		sleep 2
		@driver.find_element(:xpath, @objRepo['submit_button']).click
		
		success_message = @driver.find_element(:xpath, @objRepo['success_message']).text
		return success_message
	end

	#Following method closes the instance of open browser.
	def closeWebForm
		@driver.quit
	end
	
end

