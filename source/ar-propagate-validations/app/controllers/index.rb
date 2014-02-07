get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :create_event
end

post '/events/new' do
  @event = Event.new(params)
  if @event.save
    redirect '/'
  else
  	p "------------------------------------"
  	p @event.errors
  	p "$^$^$^$^$^$^$^$^$^$^$^$^$^$^$^$^$^$^$^"
  	@errors = @event.errors.to_a

  	erb :create_event
  end
end
