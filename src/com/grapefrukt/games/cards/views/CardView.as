package com.grapefrukt.games.cards.views {
	import com.grapefrukt.games.cards.models.Card;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import com.grapefrukt.games.cards.Settings;
	import flash.text.TextField;
	import flash.display.Sprite;

	/**
	 * @author grapefrukt
	 */
	public class CardView extends Sprite {

		private var _tf : TextField;

		public function CardView(card : Card, faceUp : Boolean = true) {
			_tf = new TextField();
			_tf.width = Settings.CARD_W;
			_tf.y = 5;
			_tf.selectable = false;
			_tf.autoSize = TextFieldAutoSize.CENTER;

			addChild(_tf);

			render(card, faceUp);
		}

		public function render(card : Card, faceUp : Boolean = true) : void {
			graphics.clear();
			graphics.beginFill(0xffffff);
			graphics.lineStyle(.1, 0xdddddd, 1, true);
			graphics.drawRoundRect(0, 0, Settings.CARD_W, Settings.CARD_H, 4);
			graphics.endFill();

			graphics.beginFill(0, 0);
			graphics.lineStyle();
			graphics.drawRect(-Settings.CARD_W, -Settings.CARD_H, Settings.CARD_W * 3, Settings.CARD_H * 3);

			_tf.defaultTextFormat = new TextFormat("Helvetica", 10, card.color ? 0xff0000 : 0x000000, true, false, false, null, null, "center");
			_tf.text = faceUp ? card.value.toString() : "";
		}
	}
}
