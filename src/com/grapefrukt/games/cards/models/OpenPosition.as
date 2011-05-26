package com.grapefrukt.games.cards.models {
	import com.grapefrukt.games.cards.models.Position;

	/**
	 * @author grapefrukt
	 */
	public class OpenPosition extends Position {

		private var _values:Vector.<int>;

		public function OpenPosition(x:int, y:int) {
			super(x, y);
			_values = new Vector.<int>(2, true);
		}

		public function get values() : Vector.<int> {
			return _values;
		}
	}
}
