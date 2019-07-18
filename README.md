Zety has made an update on 4th June and they did some changes on the website. I have updated the new software to allow user to download their resume. 18 July 2019


# Zety-Downloader
Ruby script that will enable user to download their resume from the Zety website without being a premium user

Make sure you have Ruby installed on your computer and get the following gem via terminal.

1. gem install selenium-webdriver
2. gem install wicked_pdf
3. gem install chromedriver-helper

Go to Zety.com, sign up as a user and create your resume with their templates. It is important that you sign up as a user instead of logging in with Facebook/Google.

When you are done with your resume, click preview and save the link in your clipboard. It should be in the following format: "https://app.zety.com/app/cv/<some string\>#preview"

Run the script using "ruby path/to/script/directory/zety_downloader.rb"

Follow the instructions and you should have the PDF generated for you within 20 seconds. If not, please ensure that your email, password and preview link is correct and try again.

PS: The script does not store your password or any login credentials. It simply automates many clicks, and remove Zety's javascript and use the CSS and HTML that I customized to generate the PDF.

Edit #1: Some people reported that the pdf doesn't work in older version of this script. Ensure you add ".pdf" to the downloaded file. This only applies if you have used this script before 16 February 2019.

Edit #2: If the script doesn't work due to Selenium-Webdriver, go into the script, and uncomment "require 'chromedriver-helper'" and try again.
------------
