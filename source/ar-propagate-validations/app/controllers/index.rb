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
  Event.create(organizer_name: params[:name], organizer_email: params[:email], title: params[:title], date: params[:date])
  redirect "/"
end
