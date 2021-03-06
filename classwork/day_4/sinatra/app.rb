require "sinatra"
# Adding the Sinatra reloader will enable us to change code and see
# the effect of it right away without having to restart the server
# http://www.sinatrarb.com/contrib/reloader.html
require "sinatra/reloader" if development?

# When we recieve a request that has a GET HTTP request
# with a URL of "/"
# Sinatra will execute the code in here
get "/" do
  # the response is just a simple text that is sent back
  # "Hello World"

  # This will look for a template called index.erb inside the folder 'views'
  # it will use the template to generate HTML code and send it back as
  # a response to the client
  # This will use the views/application.erb as a layout
  erb(:index, {layout: :application})
end

# This is the contact `action`
get "/contact" do
  erb :contact, layout: :application
end

post "/submit_contact" do
  # params is a Hash object that is given to us by Sinatra that contains
  # the key / value pairs from the parameters received from the client.
  # if it's a web form the key matches the "name" HTML attribute, the value
  # will be whatever the user enters in the input field
  name = params[:full_name]
  "Thanks #{name} for contacing us."
end

get "/hello" do
  "Hey There! again"
end

get "/convert_temp" do
  erb :convert_temp, layout: :application
end

post "/submit_covert_temp" do
  temperature_in_c = params[:temperature]
  @temperature_in_f = temperature_in_c.to_f * 9 / 5 + 32
  erb :convert_temp, layout: :application
end
