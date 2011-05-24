package com.grapefrukt.games.cards.players {
	import com.grapefrukt.games.cards.models.Card;
	import com.grapefrukt.games.cards.models.Playfield;
	import flash.events.IEventDispatcher;

	/**
	 * @author grapefrukt
	 */
	public interface IPlayer extends IEventDispatcher {
		function consider(card : Card, playfield : Playfield) : void;
	}
}


