package {
	import com.grapefrukt.games.cards.events.PlaceEvent;
	import com.grapefrukt.games.cards.models.Card;
	import com.grapefrukt.games.cards.models.Deck;
	import com.grapefrukt.games.cards.models.Playfield;
	import com.grapefrukt.games.cards.players.IPlayer;
	import com.grapefrukt.games.cards.players.MousePlayer;
	import com.grapefrukt.games.cards.views.GameView;

	import flash.display.Sprite;

	public class Main extends Sprite {
		private var _decks:Vector.<Deck>;
		private var _players:Vector.<IPlayer>;
		private var _playfield:Playfield;
		private var _player:int = 0;
		private var _card:Card;
		private var _view_game:GameView;

		public function Main() {
			_decks = new Vector.<Deck>(2, true);
			_decks[0] = new Deck(0);
			_decks[1] = new Deck(1);

			_playfield = new Playfield();

			_view_game = new GameView(_playfield, _decks);
			addChild(_view_game);

			_players = new Vector.<IPlayer>(2, true);
			_players[0] = new MousePlayer(_view_game.playfield);
			_players[1] = new MousePlayer(_view_game.playfield);

			_players[0].addEventListener(PlaceEvent.DECIDED, handleDecided);
			_players[1].addEventListener(PlaceEvent.DECIDED, handleDecided);

			draw(true);
		}

		private function handleDecided(e:PlaceEvent):void {
			place();
		}

		public function draw(forcePlacement:Boolean = false):void {
			_player = (_player + 1) % _decks.length;

			if (_decks[_player].length == 0) return;

			_card = _decks[_player].draw();

			_view_game.setCard(_card);

			if (forcePlacement) {
				place();
			} else {
				_players[_player].consider(_card, _playfield);
			}
		}

		public function place():void {
			trace("placed card", _card.color, _card.x, _card.y);
			_playfield.add(_card);
			draw();
		}
	}
}
