task(:scrape) do
  p "Let's scrape Senate Twitters!"
  p "Ready..Set..Go!"

  browser = Ferrum::Browser.new(browser_options: { 'no-sandbox': nil})
  browser.goto("https://www.senate.gov/senators/contact")
  browser.screenshot(path: "google.png")
  links = browser.css("div.contenttext a")

  link = links.at(1)

  contact_url = link.attribute(:href)
  
  p "Visiting #{contact_url}..."

  browser.goto(contact_url)

  senator_page_links =  browser.css("a").each do |sp_link|
    if sp_link.text.strip == "Twitter"
      p sp_link.attribute(:href)
    end
  end

  




  #links.each_with_index do |link, index|
  #  if index.odd?
  #    contact_url = link.attribute(:href)

  #    p "Visiting #{contact_url}..."

  #    browser.goto(contact_url)
      
  #    browser.css("a")


  #  end
    
  #end
  browser.quit

end