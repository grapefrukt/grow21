package com.grapefrukt.games.cards.cards {
	import flash.text.TextFieldAutoSize;
	import com.grapefrukt.games.cards.Settings;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;

	/**
	 * @author grapefrukt
	 */
	public class Card extends Sprite {

		private var _playfield_x : int = 0;
		private var _playfield_y : int = 0;
		private var _color : int = 0;
		private var _value : int = 0;
		private var _face_up : Boolean = false;
		private var _tf : TextField;

		public function Card(color : int, value : int) {
			_color = color;
			_value = value;

			_tf = new TextField();
			_tf.width = Settings.CARD_W;
			_tf.y = 5;
			_tf.selectable = false;
			_tf.autoSize = TextFieldAutoSize.CENTER;
			_tf.defaultTextFormat = new TextFormat("Helvetica", 10, color ? 0xff0000 : 0x000000, true, false, false, null, null, "center");
			addChild(_tf);
			render();
		}

		private function render() : void {
			graphics.clear();
			graphics.beginFill(0xffffff);
			graphics.lineStyle(.1, 0xdddddd, 1, true);
			graphics.drawRoundRect(0, 0, Settings.CARD_W, Settings.CARD_H, 4);
			graphics.endFill();
			
			graphics.beginFill(0, 0);
			graphics.lineStyle();
			graphics.drawRect(-Settings.CARD_W, -Settings.CARD_H, Settings.CARD_W * 3, Settings.CARD_H * 3);
			
			_tf.text = value.toString();
			_tf.visible = _face_up;
		}

		public function get color() : int {
			return _color;
		}

		public function get value() : int {
			return _value;
		}

		public function get playfieldX() : int {
			return _playfield_x;
		}

		public function get playfieldY() : int {
			return _playfield_y;
		}

		public function set playfieldX(playfield_x : int) : void {
			_playfield_x = playfield_x;
		}

		public function set playfieldY(playfield_y : int) : void {
			_playfield_y = playfield_y;
		}

		public function get faceUp() : Boolean {
			return _face_up;
		}

		public function set faceUp(face_up : Boolean) : void {
			_face_up = face_up;
			render();
		}
	}
}
