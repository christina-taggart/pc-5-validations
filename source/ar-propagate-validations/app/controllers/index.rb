get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  #TODO IMPLEMENT ME
  erb :create_event
end

post '/events/create' do
  #TODO IMPLEMENT ME
  p new_event = Event.new(params[:event])
  if !new_event.nil? && new_event.valid?
  	new_event.save
  	redirect '/'
  else
  	@errors = new_event.errors.messages
  	erb :create_event
  end
end
