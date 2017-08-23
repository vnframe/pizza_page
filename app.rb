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
end
get "/confirm" do 
    #puts "in get confirm, pizza size is #{pizza_size}"
    erb :confirm, locals: {sauce: session[:sauce_type], cheese: session[:cheese_type], meat: session[:meat_type], veg: session[:veg_type], size: session[:pizza_size]}
end
post '/confirm' do
    session[:sauce_type] = params[:sauces]
    session[:cheese_type] = params[:cheeses]
    session[:meat_type] = params[:meats]
    session[:veg_type] = params[:vegs]
    session[:pizza_size] = params[:sizes]
    p "sauce is #{session[:sauce_type]}"
    p "cheese is #{session[:cheese_type]}"
    redirect "/complete"
  end
  get '/complete' do
   erb :complete, locals: {sauce_final: session[:sauce_type], cheese_final: session[:cheese_type], meat_final: session[:meat_type], veg_final: session[:veg_type], size_final: session[:pizza_size]}
  end
#   post "/complete" do
#     session[:sauce_type] = params[:sauce]
#     session[:cheese_type] = params[:cheese]
#     session[:meat_type] = params[:meat]
#     session[:veg_type] = params[:veg]
#     session[:pizza_size] = params[:size]
#   end 