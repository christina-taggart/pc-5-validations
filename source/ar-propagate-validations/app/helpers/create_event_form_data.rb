helpers do
  def create_event_form_data
    @title = params[:title]
    @organizer_name = params[:organizer_name]
    @organizer_email = params[:organizer_email]
    @date = params[:date]
  end
end