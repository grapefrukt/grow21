package com.grapefrukt.games.cards.events {
	import com.grapefrukt.games.cards.cards.Card;
	import flash.events.Event;

	/**
	 * @author grapefrukt
	 */
	public class PlaceEvent extends Event {

		public static const DECIDED : String = "placeevent_decided";
		private var _card : Card;

		public function PlaceEvent(type : String, card : Card) {
			_card = card;
			super(type);
		}

		public function get card() : Card {
			return _card;
		}
	}
}
