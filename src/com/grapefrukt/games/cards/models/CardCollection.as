package com.grapefrukt.games.cards.models {
	import com.grapefrukt.games.cards.events.CardCollectionEvent;
	import flash.events.EventDispatcher;

	/**
	 * @author grapefrukt
	 */
	public class CardCollection extends EventDispatcher {

		protected var _cards : Vector.<Card>;

		public function CardCollection() {
			_cards = new Vector.<Card>;
		}

		public function add(card : Card) : Card {
			_cards.push(card);
			dispatchEvent(new CardCollectionEvent(CardCollectionEvent.ADDED));
			return card;
		}

		public function remove(card : Card) : Card {
			_cards.splice(_cards.indexOf(card), 1);
			dispatchEvent(new CardCollectionEvent(CardCollectionEvent.REMOVED));
			return card;
		}

		public function get length() : int {
			return _cards.length;
		}

		public function get cards() : Vector.<Card> {
			return _cards;
		}
	}
}
