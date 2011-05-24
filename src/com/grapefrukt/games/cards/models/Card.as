package com.grapefrukt.games.cards.models {
	/**
	 * @author grapefrukt
	 */
	public class Card {

		private var _x : int = 0;
		private var _y : int = 0;
		private var _color : int = 0;
		private var _value : int = 0;
		
		public function Card(color : int, value : int) {
			_color = color;
			_value = value;		
		}

		public function get color() : int {
			return _color;
		}

		public function get value() : int {
			return _value;
		}

		public function get x() : int {
			return _x;
		}

		public function get y() : int {
			return _y;
		}

		public function set x(x : int) : void {
			_x = x;
		}

		public function set y(y : int) : void {
			_y = y;
		}
	}
}
