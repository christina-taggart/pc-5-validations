get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :new_event
end

post '/events' do
  new_event = Event.new(params)
  if new_event.save
    redirect '/'
  else
    @errors = new_event.errors.full_messages
    @form_values = params
    erb :new_event
  end
end
