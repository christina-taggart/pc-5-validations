require 'sinatra/flash'

get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  @errors = flash[:errors]
  @organizer_name = flash[:organizer_name]
  @organizer_email = flash[:organizer_email]
  @title = flash[:title]
  @date = flash[:date]
  erb :event_create
end

post '/events' do
  @event = Event.new(organizer_name: params[:organizer_name],organizer_email: params[:organizer_email], title: params[:title], date: params[:date])
  if @event.save
    redirect '/'
  else
    flash[:errors] = @event.errors.full_messages
    flash[:organizer_name] = params[:organizer_name]
    flash[:organizer_email] = params[:organizer_email]
    flash[:title] = params[:title]
    flash[:date] = params[:date]
    redirect '/events/new'
  end
end
