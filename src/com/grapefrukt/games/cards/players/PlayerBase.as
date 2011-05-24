package com.grapefrukt.games.cards.players {
	import com.grapefrukt.games.cards.cards.Card;
	import com.grapefrukt.games.cards.events.PlaceEvent;
	import flash.events.EventDispatcher;

	/**
	 * @author grapefrukt
	 */
	public class PlayerBase extends EventDispatcher {

		protected function decide(card : Card) : void {
			dispatchEvent(new PlaceEvent(PlaceEvent.DECIDED, card));
		}
	}
}
