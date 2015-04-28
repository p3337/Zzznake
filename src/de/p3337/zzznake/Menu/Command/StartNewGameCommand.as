/**
 * @author Peter Hansen
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Menu.Command
{
	import de.p3337.zzznake.Main.Zzznake;

	/**
	 * The ShowMenuCommand provides an action to play a new game.
	 */
	public class StartNewGameCommand implements ICommand {
		
		/**
		 * Loads the GameView and initiates a new Game.
		 */
		public function execute():void {
			Zzznake.getInstance().setBackCommand(new ShowMenuCommand());
			Zzznake.getInstance().gameController.startNewGame();
			Zzznake.getInstance().setView(Zzznake.getInstance().gameController.getView());
		}
	}
}