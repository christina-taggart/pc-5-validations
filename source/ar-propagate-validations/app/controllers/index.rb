use Rack::Flash

get '/' do
  @events = Event.all
  erb :'events/index'
end

get '/events/:id/show' do
  @event = Event.find(id)
  erb :'events/show'
end

get '/events/new' do
  @errors = flash[:errors] || []
  erb :'events/new'
end

post '/events' do
  event = Event.create(params)
  if event.valid?
    redirect '/'
  else
    flash[:errors] = event.errors.full_messages
    redirect 'events/new'
  end

end
