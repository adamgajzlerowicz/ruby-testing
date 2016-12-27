require 'selenium-webdriver'
require 'rspec'
require 'test-unit'
require 'test/unit/assertions'

include Test::Unit::Assertions

class FullPageTest

  describe 'QA site test' do

    before(:each) do
      @driver = Selenium::WebDriver.for :firefox
      @base_url = 'http://www.demoqa.com'
      @accept_next_alert = true
      @driver.manage.timeouts.implicit_wait = 10
    end

    after(:each) do
      @driver.quit
    end

    it 'changes the page to about us' do
      @driver.get(@base_url + '/')
      @driver.find_element(:id, 'menu-item-158').click
      sleep(1)
      assert_equal @driver.find_element(:class, 'entry-title').text, 'About us'
    end

  end
end