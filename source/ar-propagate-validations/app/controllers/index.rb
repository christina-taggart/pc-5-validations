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
  @params = session[:params] || {}
  session[:errors] = nil
  session[:params] = nil
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
    session[:params] = {date: params[:date], organizer_email: params[:organizer_email],
                        organizer_name: params[:organizer_name], title: params[:title]}
    redirect '/events/new'
  end
end
