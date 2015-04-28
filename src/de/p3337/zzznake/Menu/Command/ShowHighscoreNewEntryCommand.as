/**
 * @author Peter Hansen
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Menu.Command
{	
	import de.p3337.zzznake.Main.Zzznake;

	/**
	 * The ShowHighscoreNewEntryCommand provides an action to cache the current game stats
	 * and to show the HighscoreNewEntryView to store the reached score under a certain username.
	 */
	public class ShowHighscoreNewEntryCommand implements ICommand {
		private var numberOfFoodCrunched:uint;
		private var numberOfFieldsMoved:uint;
		private var movementSpeed:uint = 0;
		
		/**
		 * Caches the current game stats.
		 *  
		 * @param numberOfFieldsMoved The number of fields the snake has moved.
		 * @param numberOfFoodCrunched The number of food the snake has collected underway.
		 * @param movementSpeed The speed level the snake has reached.
		 */
		public function ShowHighscoreNewEntryCommand(numberOfFieldsMoved:uint, numberOfFoodCrunched:uint, movementSpeed:uint) {
			this.numberOfFieldsMoved = numberOfFieldsMoved;
			this.numberOfFoodCrunched = numberOfFoodCrunched;
			this.movementSpeed = movementSpeed;
		}
		
		/**
		 * Shows the HighscoreNewEntryView to store the reached score under a certain username.
		 */
		public function execute():void {
			Zzznake.getInstance().setBackCommand(new ShowMenuCommand());
			Zzznake.getInstance().highscoreModel.calculateAndSaveScore(numberOfFieldsMoved, numberOfFoodCrunched, movementSpeed);
			Zzznake.getInstance().highscoreController.setHighscoreNewEntryViewAsCurrentView();
			Zzznake.getInstance().setView(Zzznake.getInstance().highscoreController.getView());
			Zzznake.getInstance().highscoreController.setFocusToNewEntryInputField();
		}
	}
}