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

post '/events/create' do
  event = Event.new(params)
  if event.valid?
  	event.save
 	"none"
  else
  	@errors = event.errors.messages
  	erb :errors, :layout => false
  end
  
end
