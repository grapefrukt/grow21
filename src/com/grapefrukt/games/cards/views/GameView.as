package com.grapefrukt.games.cards.views {
	import com.grapefrukt.games.cards.Settings;
	import com.grapefrukt.games.cards.models.Deck;
	import com.grapefrukt.games.cards.models.Playfield;
	import flash.display.Sprite;

	/**
	 * @author grapefrukt
	 */
	public class GameView extends Sprite {

		private var _playfield:PlayFieldView;
		private var _decks:Vector.<DeckView>;

		public function GameView(playfield:Playfield, decks:Vector.<Deck>) {
			_playfield = new PlayFieldView(playfield);
			_playfield.x = 250;
			_playfield.y = 150;
			
			_decks = new Vector.<DeckView>(2, true);
			_decks[0] = new DeckView(decks[0]);
			_decks[1] = new DeckView(decks[1]);
			
			_decks[0].x = Settings.CARD_SPACING_X;
			_decks[1].x = Settings.CARD_SPACING_X;
			
			_decks[0].y = Settings.CARD_SPACING_Y;
			_decks[1].y = Settings.CARD_SPACING_Y * 2 + Settings.CARD_H;
			
			addChild(_playfield);
			addChild(_decks[0]);
			addChild(_decks[1]);
		}

		public function get playfield() : PlayFieldView {
			return _playfield;
		}
	}
}
