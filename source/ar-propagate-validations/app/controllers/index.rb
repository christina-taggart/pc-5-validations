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
  event = Event.new(params[:event])
  if event.valid?
    event.save
    redirect "events/#{event.id}/show"
  else
    @error_list = event.errors
    erb :create_event
  end
end
