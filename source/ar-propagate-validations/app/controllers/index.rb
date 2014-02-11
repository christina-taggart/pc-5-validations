use Rack::Flash

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
  erb :event_new
end

post '/events/create' do
  #TODO IMPLEMENT ME
  event = Event.new(params[:event])
  if event.valid?
    redirect '/'
  else
    flash[:errors] = event.errors.full_messages
    redirect '/events/new'
  end
end