
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
  #TODO IMPLEMENT ME
  @new_event = Event.new(params)
  if @new_event.save
    redirect '/'
  else
    @errors = @new_event.errors.to_a

    erb :create_event
  end
end
