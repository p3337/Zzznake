/**
 * @author Peter Hansen
 * @author Daniel Wilken
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Game.Model.Collision
{
	import de.p3337.zzznake.Enum.GameObjectType;
	import de.p3337.zzznake.Game.Model.GameObject;

	/**
	 * The Collision is a helper class to indicate if two GameObjects referred to the same Field cause a collision.
	 * 
	 * @see de.p3337.zzznake.Game.Model.Field.Field
	 */
	public class Collision {
		
		private var firstParticipant:GameObject;
		private var secondParticipant:GameObject;
		
		/**
		 * Instantiates a new collision query between two participants.
		 * 
		 * @param firstParticipant A GameObject. 
		 * @param secondParticipant A GameObject.
		 */
		public function Collision(firstParticipant:GameObject, secondParticipant:GameObject) {
			this.firstParticipant = firstParticipant;
			this.secondParticipant = secondParticipant;
		}
		
		/**
		 * Checks whether or not a collision between to participants exists
		 * 
		 * @return The type of collision.
		 */
		public function getCollisionType():CollisionType {
			if(isCrunchCollision()){
				return CollisionType.CRUNCH;
			} else if(isOuchCollision()) {
				return CollisionType.OUCH;
			} else {
				throw new Error('some unknown collision has happened');
			}
		}
		
		private function isCrunchCollision():Boolean {
			return (firstParticipant.getType() === GameObjectType.FOOD && 
				secondParticipant.getType() === GameObjectType.SNAKE_HEAD) ||
				(firstParticipant.getType() === GameObjectType.SNAKE_HEAD && 
					secondParticipant.getType() === GameObjectType.FOOD);
		}
		
		private function isOuchCollision():Boolean {
			return (firstParticipant.getType() === GameObjectType.SNAKE_HEAD && 
				secondParticipant.getType() === GameObjectType.SNAKE_TAIL) ||
					(firstParticipant.getType() === GameObjectType.SNAKE_TAIL && 
						secondParticipant.getType() === GameObjectType.SNAKE_HEAD);
		}
	}
}