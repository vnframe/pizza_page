require "sinatra"
enable :sessions
get "/" do
    erb :index
end
post "/index" do
    session[:sauce_type] = params[:sauce]
    redirect "/confirm"
    "#{sauce_type} is the sauce"
end
get "/confirm" do 
    erb :confirm, locals: {sauce: session[:sauce_type]}
end