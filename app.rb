require 'sinatra'
require './lib/profile'

set :application_id, 'a6b792c4e3e83c9ea20bd424e1624912e7369772a277cbf540fd896b4a8509be'
set :secret, 'c91c7d6393eda9af4eb766f7200edefe72e65fa951cb60557d9aadf4e26e17c9'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'http://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
  if(params['upperBoundary'])
    limit = params['upperBoundary'].to_i
  else
    limit = 100
  end
  
  # TODO - add your prime number solution in the primes.rb file.
  @sum = Primes.sum_to(limit)

  erb :primes, :layout => :main
end

get '/' do
  if signed_in?
    @profile = trainee.get_profile
  end

  erb :index, :layout => :main
end

post '/update' do
  response = trainee.update_profile(params)

  if @errors = response["errors"]
    erb :error, :layout => :main
  else
    redirect '/'
  end
end

include Sinatra::OauthRoutes

def trainee
  @trainee ||= WeGotCoders::Trainee.new(settings.site_url, session[:access_token])
end



