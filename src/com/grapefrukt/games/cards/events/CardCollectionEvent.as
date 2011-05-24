package com.grapefrukt.games.cards.events {
	import flash.events.Event;

	/**
	 * @author grapefrukt
	 */
	public class CardCollectionEvent extends Event {

		public static const ADDED:String = "cardcollectionevent_added";
		public static const REMOVED:String = "cardcollectionevent_removed";

		public function CardCollectionEvent(type : String) {
			super(type);
		}
	}
}
