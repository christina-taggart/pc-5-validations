get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :make_event
end

post '/events/create' do
  @event = Event.create(params)
  @errors = @event.errors.messages
  if @errors == {}
    redirect '/'
  else
    erb :make_event
  end
end
