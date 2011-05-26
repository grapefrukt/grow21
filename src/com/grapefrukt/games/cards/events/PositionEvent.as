package com.grapefrukt.games.cards.events {
	import flash.events.Event;

	/**
	 * @author grapefrukt
	 */
	public class PositionEvent extends Event {

		public static const MOVE:String = "positionevent_move";

		public function PositionEvent(type:String) {
			super(type);
		}
	}
}
