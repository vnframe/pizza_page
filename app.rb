require "sinatra"
enable :sessions
get "/" do
    erb :index
end
post "/index" do
    session[:sauce_type] = params[:sauce]
    session[:cheese_type] = params[:cheese]
    session[:meat_type] = params[:meat]
    session[:veg_type] = params[:veg]
    session[:pizza_size] = params[:size]
    #puts "in post index, pizza size is #{pizza_size}"
    #  puts "in post index, sauce is #{sauce_type}"

    redirect "/confirm"
    "#{sauce_type} is the sauce"
end
get "/confirm" do 
    # puts "in get confirm, pizza size is #{pizza_size}"
    erb :confirm, locals: {sauce: session[:sauce_type], cheese: session[:cheese_type], meat: session[:meat_type], veg: session[:veg_type], size: session[:pizza_size]}
end