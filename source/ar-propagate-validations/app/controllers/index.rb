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
  @new_event = Event.create(organizer_name: params[:name], organizer_email: params[:email], title: params[:title], date: params[:date])
  erb :create_event
end
