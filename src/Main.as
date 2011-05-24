package {
	import com.grapefrukt.games.cards.Settings;
	import com.grapefrukt.games.cards.players.IPlayer;
	import com.grapefrukt.games.cards.events.PlaceEvent;
	import com.grapefrukt.games.cards.players.MousePlayer;
	import com.grapefrukt.games.cards.cards.Card;
	import com.grapefrukt.games.cards.cards.Deck;
	import com.grapefrukt.games.cards.cards.Playfield;
	import flash.display.Sprite;

	public class Main extends Sprite {

		private var _decks : Vector.<Deck>;
		private var _players : Vector.<IPlayer>;
		private var _playfield : Playfield;
		private var _player : int = 0;
		private var _card : Card;

		public function Main() {
			_decks = new Vector.<Deck>(2, true);
			_decks[0] = new Deck(0);
			_decks[1] = new Deck(1);

			_decks[0].x = Settings.CARD_SPACING_X;
			_decks[0].y = Settings.CARD_SPACING_Y;

			_decks[1].x = Settings.CARD_SPACING_X;
			_decks[1].y = Settings.CARD_H + Settings.CARD_SPACING_Y * 2;

			addChild(_decks[0]);
			addChild(_decks[1]);

			_playfield = new Playfield();
			_playfield.x = 250;
			_playfield.y = 150;

			addChild(_playfield);

			_players = new Vector.<IPlayer>(2, true);
			_players[0] = new MousePlayer(_playfield);
			_players[1] = new MousePlayer(_playfield);

			_players[0].addEventListener(PlaceEvent.DECIDED, handleDecided);
			_players[1].addEventListener(PlaceEvent.DECIDED, handleDecided);

			draw(true);
		}

		private function handleDecided(e : PlaceEvent) : void {
			place();
		}

		public function draw(forcePlacement:Boolean = false) : void {
			_player = (_player + 1) % _decks.length;
			
			if(_decks[_player].length == 0) return;
			
			_card = _decks[_player].draw();
			
			_card.faceUp = true;
			_card.x = 150;
			_card.y = 20;
			addChild(_card);
			
			if(forcePlacement){
				place();
			} else {
				_players[_player].consider(_card, _playfield);
			}
		}

		public function place() : void {
			trace("placed card", _card.color, _card.playfieldX, _card.playfieldY);
			removeChild(_card);
			_playfield.add(_card);
			draw();
		}
	}
}
