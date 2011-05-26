package com.grapefrukt.games.cards.views {
	import com.grapefrukt.games.cards.models.Card;
	import com.grapefrukt.games.cards.Settings;
	import com.grapefrukt.games.cards.models.Playfield;

	/**
	 * @author grapefrukt
	 */
	public class PlayFieldView extends BaseView {

		private var _playfield:Playfield;

		public function PlayFieldView(playfield:Playfield) {
			super(playfield);
			_playfield = playfield;
		}

		override public function redraw():void {
			for (var i:int = 0; i < _playfield.cards.length; i++) {
				var cv:CardView = new CardView(_playfield.cards[i]);
				positionCard(cv, _playfield.cards[i]);
				addChild(cv);
			}
		}

		public function positionCard(view:CardView, card:Card):void {
			view.x = card.x * (Settings.CARD_W + Settings.CARD_SPACING_X);
			view.y = card.y * (Settings.CARD_H + Settings.CARD_SPACING_Y);
		}

		override public function clear():void {
			while (numChildren) removeChildAt(0);
		}
	}
}
