package com.grapefrukt.games.cards.views {
	import com.grapefrukt.games.cards.events.CardCollectionEvent;
	import com.grapefrukt.games.cards.models.CardCollection;
	import flash.events.Event;
	import flash.display.Sprite;

	/**
	 * @author grapefrukt
	 */
	public class BaseView extends Sprite {

		private var _invalidated : Boolean = true;

		public function BaseView(collection : CardCollection) {
			addEventListener(Event.ENTER_FRAME, handleEnterFrame);
			if (collection) collection.addEventListener(CardCollectionEvent.ADDED, handleCardAdded);
			if (collection) collection.addEventListener(CardCollectionEvent.REMOVED, handleCardRemoved);
		}

		public function invalidate() : void {
			_invalidated = true;
		}

		public function redraw() : void {
		}

		public function clear() : void {
		}

		private function handleCardRemoved(event : CardCollectionEvent) : void {
			invalidate();
		}

		private function handleCardAdded(event : CardCollectionEvent) : void {
			invalidate();
		}

		private function handleEnterFrame(event : Event) : void {
			if (_invalidated) {
				clear();
				redraw();
				_invalidated = false;
			}
		}
	}
}
