package com.grapefrukt.games.cards.cards {
	import com.grapefrukt.games.cards.Settings;
	import flash.display.Sprite;
	/**
	 * @author grapefrukt
	 */
	public class CardCollection extends Sprite {
		
		protected var _cards : Vector.<Card>;

		public function CardCollection() {
			_cards = new Vector.<Card>;
		}

		public function add(card:Card) : Card {
			_cards.push(card);
			addChild(card);
			position(card);
			return card;
		}

		public function position(card : Card) : void {
			card.x = card.playfieldX * (Settings.CARD_W + Settings.CARD_SPACING_X);
			card.y = card.playfieldY * (Settings.CARD_H + Settings.CARD_SPACING_Y);
		}
		
		public function positionAll():void{
			for each (var card : Card in _cards) {
				position(card);
			}
		}
		
		public function remove(card:Card):Card{
			_cards.splice(_cards.indexOf(card), 1);
			removeChild(card);
			return card;
		}
	
		public function get length() : int {
			return _cards.length;
		}
		
	}
}
