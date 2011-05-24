package com.grapefrukt.games.cards.views {
	import com.grapefrukt.games.cards.models.Deck;

	/**
	 * @author grapefrukt
	 */
	public class DeckView extends BaseView {

		private var _deck : Deck;

		public function DeckView(deck : Deck) {
			super(deck);
			_deck = deck;
		}

		override public function redraw() : void {
			for (var i : int = 0; i < _deck.cards.length; i++) {
				var cv : CardView = new CardView(_deck.cards[i]);
				cv.x = i * 2;
				cv.y = 0;
				addChild(cv);
			}
		}

		override public function clear() : void {
			while (numChildren) removeChildAt(0);
		}
	}
}
