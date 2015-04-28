/**
 * @author Peter Hansen
 * @author Daniel Wilken
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Game.Model.Field
{
	import de.p3337.zzznake.Game.Model.Collision.CollisionType;

	/**
	 * The PlayingField represents array of [n x m] Fields arranged in a grid.
	 */
	public class PlayingField {
		
		private var _numberOfColumns:uint;
		private var _numberOfRows:uint;
		private var fields:Array;
		
		/**
		 * Creates a new PlayingField.
		 * 
		 * @param numberOfColumns The number of Fields to put in one row.
		 * @param numberOfRows The number of Filds to put in one column.
		 */
		public function PlayingField(numberOfColumns:uint, numberOfRows:uint) {
			_numberOfColumns = numberOfColumns;
			_numberOfRows = numberOfRows;
			createFields();
		}
		
		public function reset():void {
			for each(var row:Array in fields) {
				for each(var field:Field in row) {
					field.removeAllContent();
				}
			}
		}
		
		private function createFields():void {
			fields = new Array();
			for (var col:Number = 0; col < this.numberOfColumns; col++) {
				fields[col] = new Array();
				for (var row:Number = 0; row < this.numberOfRows; row++) {
					fields[col][row] = new Field(col, row);
				}
			}
		}
		
		/**
		 * Gets the field for the given indices.
		 * 
		 * @param rowIndex The row index of the PlayingField.
		 * @param columnIndex The column index of the PlayingField. 
		 * @return The field found for rowIndex and columnIndex.
		 */
		public function getField(rowIndex:uint, columnIndex:uint):Field {
			if(rowIndex < _numberOfColumns && columnIndex < _numberOfRows) {
				return fields[rowIndex][columnIndex];
			} else {
				throw new ArgumentError("Requested coordinates (" + rowIndex + ", " + columnIndex + ") out of bounds: PlayingField(" + _numberOfColumns + ", " + _numberOfRows + ")");
			}
		}
		
		/**
		 * Gets a Field above a given Field. 
		 * 
		 * @param field The initial Field.
		 * @return The Field above the given Field.
		 */
		public function getFieldAboveField(field:Field):Field {
			var targetX:uint = field.x;
			var targetY:uint = (field.y + this.numberOfRows - 1) % this.numberOfRows;
			return getField(targetX, targetY);
		}
		
		/**
		 * Gets a Field below a given Field.
		 *  
		 * @param field The initial Field.
		 * @return The Field above the given Field.
		 */
		public function getFieldBelowField(field:Field):Field {
			var targetX:uint = field.x;
			var targetY:uint = (field.y + 1) % this.numberOfRows;
			return getField(targetX, targetY);
		}
		
		/**
		 * Gets a Field to the left of a given Field.
		 *  
		 * @param field The initial Field.
		 * @return The Field to the left of the given Field.
		 */
		public function getFieldToTheLeftOfField(field:Field):Field {
			var targetX:uint = (field.x + this.numberOfColumns - 1) % this.numberOfColumns;
			var targetY:uint = field.y;
			return getField(targetX, targetY);
		}
		
		/**
		 * Gets a Field to the right of a given Field.
		 *  
		 * @param field The initial Field.
		 * @return The Field to the right of the given Field.
		 */
		public function getFieldToTheRightOfField(field:Field):Field {
			var targetX:uint = (field.x + 1) % this.numberOfColumns;
			var targetY:uint = field.y;
			return getField(targetX, targetY);
		}
		
		
		/**
		 * Gets a free random Field of the PlayingField.
		 * 
		 * @return A random Field without any GameObject that is tied to.
		 * @see de.p3337.zzznake.Game.Model.GameObject
		 */
		public function getFreeRandomPosition():Field {
			var freeField:Field = null;
			var freeFields:Array = getFreeFields();
			if(freeFields.length > 0) {
				var randomIndex:uint = uint(Math.floor(Math.random() * freeFields.length));
				freeField = freeFields[randomIndex];
			}
			
			return freeField;
		}
		
		/**
		 * Goes through every Field created for PlayingField and collects the free ones.
		 */
		private function getFreeFields():Array {
			var freeFields:Array = new Array();
			for (var col:Number = 0; col < this.numberOfColumns; col++) {
				for (var row:Number = 0; row < this.numberOfRows; row++) {
					var field:Field = fields[col][row];
					if(!field.hasContent()) {
						freeFields.push(field);
					}
				}
			}
			
			return freeFields;
		}
		
		/**
		 * Goes through every Field to check if there was a collision.
		 * @return Returns a specific single CollisionType that has occured, CollisionType.NONE otherwise.
		 */
		public function checkCollisions():CollisionType {
			for each(var column:Array in fields) {
				for each(var field:Field in column) {
					if(field.hasCollision()) {
						return field.getCollisionType(); 
					}
				}
			}
			return CollisionType.NONE;
		}
		
		public function get numberOfColumns():uint {
			return _numberOfColumns;
		}

		public function get numberOfRows():uint {
			return _numberOfRows;
		}
	}
}