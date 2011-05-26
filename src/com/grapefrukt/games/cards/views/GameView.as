package com.grapefrukt.games.cards.views {
	import com.grapefrukt.games.cards.events.PositionEvent;
	import com.grapefrukt.games.cards.models.Card;
	import com.grapefrukt.games.cards.Settings;
	import com.grapefrukt.games.cards.models.Deck;
	import com.grapefrukt.games.cards.models.Playfield;
	import flash.display.Sprite;

	/**
	 * @author grapefrukt
	 */
	public class GameView extends Sprite {

		private var _playfield_view:PlayFieldView;
		private var _decks_view:Vector.<DeckView>;
		private var _card_view:CardView;
		private var _card:Card;

		public function GameView(playfield:Playfield, decks:Vector.<Deck>) {
			_playfield_view = new PlayFieldView(playfield);
			_playfield_view.x = 250;
			_playfield_view.y = 150;

			_decks_view = new Vector.<DeckView>(2, true);
			_decks_view[0] = new DeckView(decks[0]);
			_decks_view[1] = new DeckView(decks[1]);

			_decks_view[0].x = Settings.CARD_SPACING_X;
			_decks_view[1].x = Settings.CARD_SPACING_X;

			_decks_view[0].y = Settings.CARD_SPACING_Y;
			_decks_view[1].y = Settings.CARD_SPACING_Y * 2 + Settings.CARD_H;

			addChild(_playfield_view);
			addChild(_decks_view[0]);
			addChild(_decks_view[1]);
		}

		public function get playfield():PlayFieldView {
			return _playfield_view;
		}

		public function setCard(card:Card):void {
			if (_card_view) removeChild(_card_view);
			if (_card) _card.removeEventListener(PositionEvent.MOVE, handleCardMove);

			_card = card;
			_card.addEventListener(PositionEvent.MOVE, handleCardMove);
			
			_card_view = new CardView(_card);
			addChild(_card_view);
			
		}

		private function handleCardMove(e:PositionEvent):void {
			_playfield_view.positionCard(_card_view, _card);
			_card_view.x += _playfield_view.x;
			_card_view.y += _playfield_view.y;
		}
	}
}
