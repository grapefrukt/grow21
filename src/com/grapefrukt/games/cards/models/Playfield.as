package com.grapefrukt.games.cards.models {
	/**
	 * @author grapefrukt
	 */
	public class Playfield extends CardCollection {
		private var _open_positions:Vector.<OpenPosition>;
		private var _position_dict:Object;

		override public function add(card:Card):Card {
			super.add(card);
			calculateOpenPositions();
			return card;
		}

		override public function remove(card:Card):Card {
			super.remove(card);
			calculateOpenPositions();
			return card;
		}

		private function calculateOpenPositions():Vector.<OpenPosition> {
			_position_dict = {};

			// add all adjacent card slots to a dictionary
			for each (var card : Card in _cards) {
				_position_dict[card.x + "@" + card.y] = { card: card, x: card.x, y: card.y };
				if (!_position_dict[(card.x + 1) + "@" + (card.y + 0)]) _position_dict[(card.x + 1) + "@" + (card.y + 0)] = { card: null, x: card.x + 1, y: card.y + 0 };
				if (!_position_dict[(card.x - 1) + "@" + (card.y + 0)]) _position_dict[(card.x - 1) + "@" + (card.y + 0)] = { card: null, x: card.x - 1, y: card.y + 0 };
				if (!_position_dict[(card.x + 0) + "@" + (card.y + 1)]) _position_dict[(card.x + 0) + "@" + (card.y + 1)] = { card: null, x: card.x + 0, y: card.y + 1 };
				if (!_position_dict[(card.x + 0) + "@" + (card.y - 1)]) _position_dict[(card.x + 0) + "@" + (card.y - 1)] = { card: null, x: card.x + 0, y: card.y - 1 };
			}

			_open_positions = new Vector.<OpenPosition>();

			for (var i : String in _position_dict) {
				if (_position_dict[i]['card']) continue;
				var op:OpenPosition = new OpenPosition(_position_dict[i]['x'], _position_dict[i]['y']);
				calculateValue(op);
				_open_positions.push(op);
			}

			return _open_positions;
		}

		private function calculateValue(op:OpenPosition):void {
			var queues:Vector.<Vector.<Card>> = new Vector.<Vector.<Card>>();
			queues[0] = new Vector.<Card>();
			queues[1] = new Vector.<Card>();
			
			queueAdjacent(op, 0, queues[0]);
			queueAdjacent(op, 1, queues[1]);

			var card : Card; 
			for each (card in queues[0]) op.values[card.color] += card.value;
			for each (card in queues[1]) op.values[card.color] += card.value;
		}

		private function queueAdjacent(pos:Position, color:int, queue:Vector.<Card>):void {
			queueFromOffset(-1, 0, pos, color, queue);
			queueFromOffset(+1, 0, pos, color, queue);
			queueFromOffset(0, -1, pos, color, queue);
			queueFromOffset(0, +1, pos, color, queue);
		}

		private function queueFromOffset(x:int, y:int, pos:Position, color:int, queue:Vector.<Card>):void {
			var c:Card = getCardAt(pos.x + x, pos.y + y);
			if (c && c.color == color && queue.indexOf(c) == -1){
				queue.push(c);
				queueAdjacent(c, color, queue);
			}
		}

		public function getCardAt(x:int, y:int):Card {
			return _position_dict[x + "@" + y] ? _position_dict[x + "@" + y]['card'] : null;
		}

		public function checkIsOpen(x:int, y:int):Boolean {
			return _position_dict[x + "@" + y];
		}

		public function get openPositions():Vector.<OpenPosition> {
			return _open_positions;
		}
	}
}
