get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :event_new
end

post '/events' do
  new_event = params[:new_event]
  event = Event.new(new_event)
  if event.save
  	redirect "/"
  else
  	redirect back
  end
end
