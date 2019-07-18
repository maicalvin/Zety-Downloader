require 'wicked_pdf'
require 'selenium-webdriver'
require 'io/console'
require 'chromedriver-helper'
require 'capybara'

path = Dir.pwd+'/temp_index.html'
File.write(path, File.read('./index.html'))


puts 'Logging In'
print 'Email: '
email_login = gets.chomp
print 'Password: '
password_login = STDIN.noecho(&:gets).chomp
puts ''
print 'Link to Zety resume: '
preview_site = gets.chomp

options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
 #options = Selenium::WebDriver::Chrome::Options.new
driver = Selenium::WebDriver.for(:chrome, options: options)

driver.get('https://app.zety.com/login?v=classic')

driver.title == "Resume Builder Login | Zety" ? (puts 'Logging in and generating PDF, please wait for ~15 seconds') : ()
classic = driver.find_element(:id,'showLoginForm')
sleep(5)
driver.execute_script("arguments[0].click();",classic)
puts 'success'

email = driver.find_element(name: 'email')
password = driver.find_element(name: 'password')

email.send_keys(email_login)
password.send_keys(password_login)
password.submit
sleep(3)

driver.get(preview_site)
sleep(8)
content = driver.find_element(css: '#creatorContainer').attribute("innerHTML")

lines = File.readlines(path)
lines[11] = content << $/
File.open(path, 'w') { |f| f.write(lines.join) }

pdf = WickedPdf.new.pdf_from_html_file(path)
File.open('./new_resume', 'wb') do |file|
  file << pdf
end
driver.quit

File.delete('./temp_index.html')
puts 'PDF complete'

WickedPdf.config = {
  :exe_path => Rails.root.join('bin', 'wkhtmltopdf-i386').to_s,
}
