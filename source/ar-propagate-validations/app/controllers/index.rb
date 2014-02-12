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
  if event.nil? || !event.valid?
    flash[:errors] = event.errors.messages
    redirect '/events/new'
  else
    event.save
    redirect '/'
  end
end