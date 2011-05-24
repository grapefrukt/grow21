package com.grapefrukt.games.cards.cards {
	/**
	 * @author grapefrukt
	 */
	public class Playfield extends CardCollection {

		public function checkValid(testCard : Card) : Boolean {
			trace("check valid", testCard.color, testCard.playfieldX, testCard.playfieldY);
			return checkIsAdjacent(testCard) && checkFree(testCard);
		}

		private function checkIsAdjacent(testCard : Card) : Boolean {
			for each (var card : Card in _cards) {
				if (card.playfieldX == testCard.playfieldX && card.playfieldY == testCard.playfieldY - 1) return true;
				if (card.playfieldX == testCard.playfieldX && card.playfieldY == testCard.playfieldY + 1) return true;
				if (card.playfieldX == testCard.playfieldX + 1 && card.playfieldY == testCard.playfieldY) return true;
				if (card.playfieldX == testCard.playfieldX - 1 && card.playfieldY == testCard.playfieldY) return true;
			}
			return false;
		}

		protected function checkFree(testCard : Card) : Boolean {
			for each (var card : Card in _cards) {
				if (card.playfieldX == testCard.playfieldX && card.playfieldY == testCard.playfieldY) return false;
			}
			return true;
		}
	}
}
