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
  erb :create_event_form
end

post '/events/create' do
  #TODO IMPLEMENT ME
  @event = Event.new(params)
 if @event.save
  redirect '/'	
 else 
 	@title = params[:title]
 	@email = params[:organizer_email]
 	@name = params[:organizer_name]
 	@date = params[:date]
 	 erb :redo_event_form
 end
end
