require 'json'

get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
	@new_event = {}
	if session[:new_event]
		@new_event = JSON.parse session[:new_event]
		event = Event.new(@new_event)
		event.save
		@errors = event.errors.full_messages
		session.delete(:new_event)
	end
  erb :event_new
end

post '/events' do
  new_event = params[:new_event]
  event = Event.new(new_event)
  if event.save
  	redirect "/"
  else
  	session[:new_event] = new_event.to_json
  	redirect back
  end
end
