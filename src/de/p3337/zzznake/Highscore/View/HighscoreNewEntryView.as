/**
 * @author Peter Hansen
 * @copyright p3337.de All rights reserved.
 */
package de.p3337.zzznake.Highscore.View
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import flash.display.Sprite;
	
	import de.p3337.zzznake.Highscore.Model.HighscoreModel;
	import de.p3337.zzznake.Main.Zzznake;
	import de.p3337.zzznake.Util.DefaultButton;
	import de.p3337.zzznake.Util.DefaultInput;
	import de.p3337.zzznake.Util.DefaultHeadline;

	/**
	 * The HighscoreNewEntryView creates a view to show the attained score and prompts to enter the username. 
	 */
	public class HighscoreNewEntryView {
		
		private var model:HighscoreModel;
		private var _view:Sprite;
		
		private var _saveButton:DefaultButton;
		private var _highscoreInput:DefaultInput;
		
		private var header:Sprite;
		private var body:Sprite;
		private var infoTextField:TextField;
		
		/**
		 * Creates a new HighscoreNewEntryView.
		 * 
		 * @param HighscoreModel
		 */
		public function HighscoreNewEntryView(highscoreModel:HighscoreModel) {
			model = highscoreModel;
			_view = new Sprite();
			_view.x = Zzznake.ZZZNAKE_PADDING;
			
			draw();
		}
		
		public function draw():void {
			addHeader();
			addBody();
			
			saveButton = new DefaultButton("Save");
			saveButton.y = Zzznake.ZZZNAKE_HEIGHT - saveButton._height - Zzznake.ZZZNAKE_PADDING;
			_view.addChild(saveButton);
		}
		
		private function addHeader():void {
			header = new Sprite();
			header.y = Zzznake.ZZZNAKE_PADDING;
			header.addChild(new DefaultHeadline("Highscore"));
			_view.addChild(header);
		}
		
		private function addBody():void {
			body = new Sprite();
			body.y = header.y + header.height + Zzznake.ZZZNAKE_PADDING;
			
			addScoreInfoText(model.lastScore.toString());
			addInput("Enter you name");
			
			_view.addChild(body);
		}
		
		private function addScoreInfoText(score:String):void {
			var formatInfo:TextFormat = new TextFormat();
			formatInfo.font = "Courier New";
			formatInfo.color = 0x000000;
			formatInfo.size = 16;
			
			infoTextField = new TextField();
			infoTextField.defaultTextFormat = formatInfo;
			infoTextField.text = "Congratulations! Your score is " + score;
			infoTextField.width = (Zzznake.ZZZNAKE_WIDTH - (Zzznake.ZZZNAKE_PADDING * 2));
			infoTextField.height = 20;
			body.addChild(infoTextField);
		}
		
		private function addInput(labelValue:String = "", inputValue:String = ""):void {
			_highscoreInput = new DefaultInput(labelValue);
			_highscoreInput.y = Zzznake.ZZZNAKE_PADDING * 2;
			body.addChild(highscoreInput);
		}
		
		public function update(event:*):void {
			updateScore(model.lastScore.toString());
		}
		
		private function updateScore(score:String):void {
			infoTextField.text = "Congratulations! Your score is " + score;
		}
		
		public function get view():Sprite {
			return _view;
		}

		public function get saveButton():DefaultButton {
			return _saveButton;
		}

		public function set saveButton(value:DefaultButton):void {
			_saveButton = value;
		}

		public function getUsername():String {
			return highscoreInput.getInputValue();
		}

		public function get highscoreInput():DefaultInput {
			return _highscoreInput;
		}
	}
}