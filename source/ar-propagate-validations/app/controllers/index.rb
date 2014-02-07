get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  @errors = session[:errors]
  session[:errors] = nil
  erb :event_form
end

post '/events/create' do
  p params
  event = Event.new(params)
  if event.valid?
    event.save
    redirect "/events/#{event.id}/show"
  else
    session[:errors] = event.errors
    redirect '/events/new'
  end
end
