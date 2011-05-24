package com.grapefrukt.games.cards.players {
	import flash.events.MouseEvent;
	import com.grapefrukt.games.cards.Settings;
	import flash.display.InteractiveObject;
	import com.grapefrukt.games.cards.players.IPlayer;
	import com.grapefrukt.games.cards.cards.Playfield;
	import com.grapefrukt.games.cards.cards.Card;

	/**
	 * @author grapefrukt
	 */
	public class MousePlayer extends PlayerBase implements IPlayer {

		private var _mouseTarget : InteractiveObject;
		private var _card : Card;
		private var _playfield : Playfield;

		public function MousePlayer(mouseTarget : InteractiveObject) {
			_mouseTarget = mouseTarget;
		}

		public function consider(card : Card, playfield : Playfield) : void {
			_playfield = playfield;
			_card = card;
			_mouseTarget.stage.addEventListener(MouseEvent.CLICK, handlePlace);
			_mouseTarget.stage.addEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove);
			handleMouseMove(null);
		}

		private function handleMouseMove(event : MouseEvent) : void { 
			setCardPosition();
			_playfield.position(_card);
			_card.x += _playfield.x;
			_card.y += _playfield.y;
		}

		private function setCardPosition() : void {
			_card.playfieldX = Math.round(_mouseTarget.mouseX / (Settings.CARD_W + Settings.CARD_SPACING_X) - .5);
			_card.playfieldY = Math.round(_mouseTarget.mouseY / (Settings.CARD_H + Settings.CARD_SPACING_Y) - .5);
		}

		public function handlePlace(e : MouseEvent) : void {
			setCardPosition();
			if (_playfield.checkValid(_card)) decide(_card);
		}

		override protected function decide(card : Card) : void {
			_mouseTarget.stage.removeEventListener(MouseEvent.CLICK, handlePlace);
			_mouseTarget.stage.removeEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove);
			super.decide(card);
		}
	}
}