package com.grapefrukt.games.cards.models {
	import com.grapefrukt.games.cards.Settings;

	/**
	 * @author grapefrukt
	 */
	public class Deck extends CardCollection {

		public function Deck(color : int) {
			var value : int = 0;
			for (var i : int = 0; i < Settings.CARD_SETS_PER_DECK; i++) {
				for (var j : int = Settings.CARD_MIN_VALUE; j <= Settings.CARD_MAX_VALUE; j++) {
					value = Math.min(Settings.CARD_VALUE_CEIL, j);
					add(new Card(color, value));
				}
			}
			shuffle();
		}

		public function draw() : Card {
			return remove(_cards[0]);
		}

		public function shuffle() : void {
			var tmp : Card;
			var rnd : int;
			for (var i : int = 0; i < _cards.length; i++) {
				rnd = i + Math.random() * (_cards.length - i);
				tmp = _cards[i];
				_cards[i] = _cards[rnd];
				_cards[rnd] = tmp;
			}
		}
	}
}
