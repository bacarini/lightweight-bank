post '/transfer' do
  data = JSON.parse request.body.read
  begin
    BulkTransactionsHandler.new(data).transfer
  rescue ActiveRecord::RecordNotFound => e
    halt 404
  rescue InsufficientCredits => e
    halt 422
  end
  status 201
end
