enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/new' do
  game = Game.create
    
  player1 = Player.find_or_create_by_name(params[:player1])
  player2 = Player.find_or_create_by_name(params[:player2])
  Round.create(player_id:player1.id,game_id:game.id)
  Round.create(player_id:player2.id,game_id:game.id)

  redirect to "/game/#{game.id}"
end

get '/game/:game_id' do
  @game = Game.find(params[:game_id])
  if @game.winner
    redirect '/'
  else
    erb :game
  end
end

post '/game/:game_id' do
  @game = Game.find(params[:game_id])
  @game.update_attributes(winner: params[:winner], url: Game.generate_url)
  erb :game_over, layout: false
  # redirect '/gameover', :locals => { :last_game => params[:game_id] }
end

get "/gameover" do  
  p session[:last_game]
  # @game = Game.find(session[:last_game])
  # p @game
  erb :game_over
end

get '/:game_url' do
  @game = Game.find_by(url:params[:game_url])

  erb :game_over, layout: false
end
