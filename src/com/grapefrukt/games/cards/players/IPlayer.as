package com.grapefrukt.games.cards.players {
	import flash.events.IEventDispatcher;
	import com.grapefrukt.games.cards.cards.Card;
	import com.grapefrukt.games.cards.cards.Playfield;

	/**
	 * @author grapefrukt
	 */
	public interface IPlayer extends IEventDispatcher {
		function consider(card : Card, playfield : Playfield) : void;
	}
}


