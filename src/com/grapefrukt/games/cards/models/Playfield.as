package com.grapefrukt.games.cards.models {
	/**
	 * @author grapefrukt
	 */
	public class Playfield extends CardCollection {

		public function checkValid(testCard : Card) : Boolean {
			trace("check valid", testCard.color, testCard.x, testCard.y);
			return checkIsAdjacent(testCard) && checkFree(testCard);
		}

		private function checkIsAdjacent(testCard : Card) : Boolean {
			for each (var card : Card in _cards) {
				if (card.x == testCard.x && card.y == testCard.y - 1) return true;
				if (card.x == testCard.x && card.y == testCard.y + 1) return true;
				if (card.x == testCard.x + 1 && card.y == testCard.y) return true;
				if (card.x == testCard.x - 1 && card.y == testCard.y) return true;
			}
			return false;
		}

		protected function checkFree(testCard : Card) : Boolean {
			for each (var card : Card in _cards) {
				if (card.x == testCard.x && card.y == testCard.y) return false;
			}
			return true;
		}
	}
}
