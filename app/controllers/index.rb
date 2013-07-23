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
  erb :game
end

