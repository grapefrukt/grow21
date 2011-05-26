package com.grapefrukt.games.cards.models {
	/**
	 * @author grapefrukt
	 */
	public class Card extends Position {

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
	}
}
