/**
 * @author Peter Hansen
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Sound
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	import de.p3337.zzznake.Enum.SoundFile;
	
	/**
	 * This class provides a global playback to sound all effects and the main theme.
	 */
	public final class Jukebox {
		
		private static var _instance:Jukebox;
		
		[Embed(source="de/p3337/zzznake/Library/crunch_food.mp3")]
		private var crunchFoodClass:Class;
		private var crunchFoodSound:Sound;
		
		[Embed(source="de/p3337/zzznake/Library/game_over.mp3")]
		private var gameOverClass:Class;
		private var gameOverSound:Sound;
		
		[Embed(source="de/p3337/zzznake/Library/theme.mp3")]
		private var themeClass:Class;
		private var themeSound:Sound;
		
		private var soundChannel:SoundChannel;
		
		private var currentSoundFile:SoundFile;
		
		public function Jukebox() {
			if(_instance){
				throw new Error("Singleton... use getInstance()");
			} 
			_instance = this;
			
			soundChannel = new SoundChannel();
			
			initSounds();
		}
		
		public static function getInstance():Jukebox {
			if(!_instance){
				new Jukebox();
			} 
			return _instance;
		}
		
		private function initSounds():void {
			crunchFoodSound = new crunchFoodClass();
			gameOverSound = new gameOverClass();
			themeSound = new themeClass();
		}
		
		public function play(soundFile:SoundFile):void {
			currentSoundFile = soundFile;
			
			switch(soundFile) {
				case SoundFile.THEME:
					soundChannel = themeSound.play();
					break;
				case SoundFile.GAME_OVER:
					soundChannel = gameOverSound.play();
					break;
				case SoundFile.CRUNCH_FOOD:
					soundChannel = crunchFoodSound.play();
					break;
			}
		}
		
		public function stop():void {
			soundChannel.stop();
		}
	}
}