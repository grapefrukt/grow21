package com.grapefrukt.games.cards.models {
	import com.grapefrukt.games.cards.events.PositionEvent;
	import flash.events.EventDispatcher;
	/**
	 * @author grapefrukt
	 */
	public class Position extends EventDispatcher {

		private var _x:int = 0;
		private var _y:int = 0;

		public function Position(x:int = 0, y:int = 0) {
			_x = x;
			_y = y;
		}

		public function get x():int {
			return _x;
		}

		public function get y():int {
			return _y;
		}

		public function set x(x:int):void {
			_x = x;
			dispatchEvent(new PositionEvent(PositionEvent.MOVE));
		}

		public function set y(y:int):void {
			_y = y;
			dispatchEvent(new PositionEvent(PositionEvent.MOVE));
		}
	}
}
